# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#


$( document ).on 'turbolinks:load', ->
  setInterval ->
    Rails.ajax({
      type: 'GET',
      url: '/stats',
      success: (data) ->
        $('.fossil-counts .total .number').text(data.fossil.total_tries)
        $('.fossil-counts .current .number').text(data.fossil.run_tries)
        $('.alolan-counts .total .number').text(data.alolan.total_tries)
        $('.alolan-counts .current .number').text(data.alolan.run_tries)
        $('.starter-counts .total .number').text(data.starter.total_tries)
        $('.starter-counts .chimcar_total .number').text(data.starter.chimchar_total)
        $('.starter-counts .turtwig_total .number').text(data.starter.turtwig_total)
        $('.starter-counts .piplup_total .number').text(data.starter.piplup_total)
        $('.starter-counts .current .number').text(data.starter.run_tries)
    })
  , 10000

  rgbToHsl = (r, g, b) ->
    r /= 255
    g /= 255
    b /= 255
    max = Math.max(r, g, b)
    min = Math.min(r, g, b)
    h = undefined
    s = undefined
    l = (max + min) / 2
    if max == min
      h = s = 0
      # achromatic
    else
      d = max - min
      s = if l > 0.5 then d / (2 - max - min) else d / (max + min)
      switch max
        when r
          h = (g - b) / d + (if g < b then 6 else 0)
        when g
          h = (b - r) / d + 2
        when b
          h = (r - g) / d + 4
      h /= 6
    [
      h
      s
      l
    ]

  getPixel = () ->
    img = document.getElementById('webcam')
    img.crossOrigin = "Anonymous"
    canvas = document.getElementById('example')
    context = canvas.getContext('2d')
    context.drawImage(img, 0, 0)
    rgb = context.getImageData(320, 240, 1, 1)
    return rgbToHsl(rgb.data[0], rgb.data[1], rgb.data[2])

  # setInterval ->
  #   if $('.hue .number').length
  #     $('.hue .number').text(Math.round(getPixel()[0] * 360))
  # , 200