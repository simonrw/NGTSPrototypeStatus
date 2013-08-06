#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Uploads the action information

Information uploaded:
    * mjd
    * sky_background
    * humidity
    * ambient_temp
    * ccd_temp
    * fwhm
    * airmass
    * tel_ra
    * tel_dec
    * exposure_time - 
    * moon_distance - 
    * sun_distance - 


Usage:
    tools/upload_action.py [options] <dir>

Options:
    -h, --help                  Show this help
    -n, --nfiles <nfiles>       Limit the number of files uploaded
'''

import numpy as np
from docopt import docopt
import json
import os
import pyfits
import requests
import subprocess as sp
import re
import tempfile

def get_action_id(dirname):
    match = re.search(r'action(?P<id>\d+)_', dirname)
    return int(match.group('id'))

def extract_from_image(filename):
    print 'Running sextractor'
    with tempfile.NamedTemporaryFile() as paramfile:
        with tempfile.NamedTemporaryFile() as convfile:
            with tempfile.NamedTemporaryFile() as outfile:
                paramfile.write('NUMBER\n'
                        'FLAGS\n'
                        'BACKGROUND\n'
                        'FWHM_IMAGE\n')

                convfile.write('CONV NORM\n'
                            '# 3x3 ``all-ground'' convolution mask with FWHM = 2 pixels.\n'
                            '1 2 1\n'
                            '2 4 2\n'
                            '1 2 1\n')

                paramfile.seek(0)
                convfile.seek(0)

                cmd = ['sex', filename, '-catalog_name', outfile.name,
                        '-catalog_type', 'FITS_LDAC',
                        '-parameters_name', paramfile.name,
                        '-filter_name', convfile.name]
                sp.check_call(cmd)
                outfile.seek(0)

                cat_data = pyfits.getdata(outfile.name, 'ldac_objects')

    ind = cat_data['flags'] == 0
    cat_data = cat_data[ind]

    background = cat_data['background']
    fwhm = cat_data['fwhm_image']

    ind = (background > 0) & (fwhm > 0)
    med_sky = np.average(background[ind])
    med_fwhm = np.average(fwhm[ind])


    return (med_sky if med_sky == med_sky else None, 
            med_fwhm if med_fwhm == med_fwhm else None)


    

def analyse_file(filename):
    print 'Analysing {}'.format(filename)
    header = pyfits.getheader(filename)
    exptime = header.get('exposure', None)
    mjd = header.get('mjd', None)
    airmass = header.get('airmass', None)
    tel_ra = header.get('tel_ra', None)
    tel_dec = header.get('tel_dec', None)
    humidity = header.get('wxhumid', None)
    ambient_temp = header.get('wxtemp', None)
    ccd_temp = header.get('ccdtemp', None)
    moon_dist = header.get('moondist', None)
    sun_dist = header.get('sundist', None)

    sky, fwhm = extract_from_image(filename)

    return {
        'mjd': mjd,
        'airmass': airmass,
        'tel_ra': tel_ra,
        'tel_dec': tel_dec,
        'humidity': humidity,
        'ambient_temp': ambient_temp,
        'ccd_temp': ccd_temp,
        'sky_background': sky / exptime if exptime else None,
        'fwhm': fwhm,
        'exposure_time': exptime,
        'moon_distance': moon_dist,
        'sun_distance': sun_dist,
        }

def main(args):
    files = [os.path.join(args['<dir>'], f) for f in os.listdir(args['<dir>'])]
    if args['--nfiles']:
        nfiles = int(args['--nfiles'])
        print 'Limiting the number of files to {}'.format(nfiles)
        files = files[:nfiles]


    measurement_objects = map(analyse_file, files)

    headers = {
                'Content-Type': 'application/json',
                'Accepts': 'application/json'
                }
    data = {
                'observation': {
                    'observation_number': get_action_id(args['<dir>']),
                    'measurements_attributes': measurement_objects
                    }
                }
    r = requests.post('http://localhost:3000/observations',
            headers=headers,
            data=json.dumps(data)
            )
    print r.ok

if __name__ == '__main__':
    main(docopt(__doc__))
