require 'rmagick'

class Webcam
  def shiny?(range)
    hue = get_pixel_color
    puts "Hue: #{hue}"
    !hue.in? range
  end

  def get_pixel_color
    img = get_screenshot
    img.quantize(256)
    pixel = img.pixel_color(320, 240)
    hex   = pixel.to_hsla.first
  end

  def get_screenshot
    # http://localhost:8081/current
    # https://pbs.twimg.com/media/Dzh63JiV4AEtiAN.jpg:large
    image = Magick::Image.read('/lastsnap.jpg').first
    image.write('pokemon.jpg')
    image
  end
end
