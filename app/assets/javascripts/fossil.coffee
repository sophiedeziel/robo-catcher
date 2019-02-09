# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$( document ).on 'turbolinks:load', ->
  if $('.fossil-counts')
    setInterval ->
      Rails.ajax({
        type: 'GET',
        url: '/fossil',
        success: (data) ->
          $('.fossil-counts .total .number').text(data.total_tries)
          $('.fossil-counts .current .number').text(data.run_tries)
      })
    , 10000

