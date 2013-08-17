plot_dataset = (elem, x, y, xlabel, ylabel) ->
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

ready = ->
    plot_dataset 'fwhm', 'mjd', 'fwhm', 'MJD', 'FWHM'
    plot_dataset 'sky-background', 'mjd', 'sky_background', 'MJD', 'Sky background'
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
            data: plot_data.map (item) ->
                [ item['mjd'], item['ambient_temp'] ]
            animation: false
            yAxis: 0
            name: 'Temperature'
        }, {
            data: plot_data.map (item) ->
                [ item['mjd'], item['humidity'] ]
            animation: false
            yAxis: 1
            name: 'Humidity'
        }]
    }




# Jquery loading 
$(document).ready(ready)

# Turbolinks loading
$(document).on("page:load", ready)

