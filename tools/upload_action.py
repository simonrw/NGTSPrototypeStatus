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


Usage:
    tools/upload_action.py [options] <dir>

Options:
    -h, --help                  Show this help
'''

from docopt import docopt
import json
import os
import pyfits
import requests
import subprocess as sp
import re

def get_action_id(dirname):
    match = re.search(r'action(?P<id>\d+)_', dirname)
    return int(match.group('id'))



def analyse_file(filename):
    print 'Analysing {}'.format(filename)
    header = pyfits.getheader(filename)
    mjd = header.get('mjd', None)
    airmass = header.get('airmass', None)
    tel_ra = header.get('tel_ra', None)
    tel_dec = header.get('tel_dec', None)
    humidity = header.get('wxhumid', None)
    ambient_temp = header.get('wxtemp', None)
    ccd_temp = header.get('ccdtemp', None)

    return {
            'mjd': mjd,
            # 'airmass': airmass,
            # 'tel_ra': tel_ra,
            # 'tel_dec': tel_dec,
            'humidity': humidity,
            'ambient_temp': ambient_temp,
            'ccd_temp': ccd_temp,
            }
    

def main(args):
    files = [os.path.join(args['<dir>'], f) for f in os.listdir(args['<dir>'])]
    measurement_objects = map(analyse_file, files[:2])

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
