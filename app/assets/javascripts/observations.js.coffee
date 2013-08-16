# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

plot_dataset = (elem, x, y) ->
    $(elem).highcharts {
        chart:
            type: 'scatter'
        series: [{
            name: "Test"
            data: plot_data.map (item) ->
                [ item[x], item[y] ]
            animation: false
        }]
    }

ready = ->
    plot_dataset '#plot-image', 'mjd', 'ambient_temp'


# Jquery loading 
$(document).ready(ready)

# Turbolinks loading
$(document).on("page:load", ready)
