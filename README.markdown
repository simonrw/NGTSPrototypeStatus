# NGTS Prototype Status

This app documents the nightly quality plots for the Geneva prototype

## Structure

The main class will be the `actions` class, which contains the information about a single action, as this is the unit of work chosen by the consortium. This action will have a series of measurements, but it also belongs to a night object, if the dates of said action are required.

## Models 

`class Night`

* start_date
* end_date

* `has_many :actions`

Validations

* `validates :start_date, :presence => true
* `validates :end_date, :presence => true

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
