# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Function for plotting the required data
plot_dataset = (plot_data, elem, x, y, xlabel, ylabel) ->
    jQuery('<div/>', {
        id: elem
        style: 'width:100%; height: 300px;'
    }).appendTo('#plot-images')

    $('#' + elem).highcharts {
        chart:
            type: 'scatter'
        xAxis:
            title:
                text: xlabel
        yAxis:
            title:
                text: ylabel
        title:
            text: null
        legend:
            enabled: false
        plotOptions:
            series:
                allowPointSelect: false
                enableMouseTracking: false
        series: [{
            data: plot_data.map (item) ->
                [ item[x], item[y] ]
            animation: false
        }]
    }

object_url = (id) ->
    '/observations/' + id

ready = ->
    # Get the object id
    observation_id = $('div#plot-images').data('observation-id')
    if observation_id?
        $.getJSON(object_url(observation_id), (json) ->
            # First hide the loading image
            $('#loading').hide()

            plot_dataset json, 'fwhm', 'mjd', 'fwhm', 'MJD', 'FWHM'
            plot_dataset json, 'sky-background', 'mjd', 'sky_background', 'MJD', 'Sky background'
            elem = 'ambient'
            jQuery('<div/>', {
                id: elem
                style: 'width:100%; height: 300px;'
            }).appendTo('#plot-images')

            $('#' + elem).highcharts {
                chart:
                    type: 'scatter'
                xAxis:
                    title:
                        text: 'MJD'
                yAxis: [{
                    title:
                        text: 'Temperature'
                }, {
                    title:
                        text: 'Humidity'
                    opposite: true
                }]

                title:
                    text: null
                plotOptions:
                    series:
                        allowPointSelect: false
                        enableMouseTracking: false
                series: [{
                    data: json.map (item) ->
                        [ item['mjd'], item['ambient_temp'] ]
                    animation: false
                    yAxis: 0
                    name: 'Temperature'
                }, {
                    data: json.map (item) ->
                        [ item['mjd'], item['humidity'] ]
                    animation: false
                    yAxis: 1
                    name: 'Humidity'
                }]
            }
        ).fail(->
            $('#loading').text('Failed to load image')
            console.log('Error occured')
        )





# Jquery loading 
$(document).ready(ready)

# Turbolinks loading
$(document).on("page:load", ready)

