# NGTS Prototype Status

This app documents the nightly quality plots for the Geneva prototype

## Structure

## Models 

`class Night`

* start_date
* end_date

* `has_many :actions`

`class Action`

* action_id
* night_id

* `belongs_to :night`
* `has_many :measurements`

`class Measurement`

* action_id
* mjd
* sky_background
* humidity
* ambient_temp
* ccd_temp
* fwhm

* `belongs_to :action`
