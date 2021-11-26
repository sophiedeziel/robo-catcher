require 'rmagick'

class Webcam
  def shiny?(range)
    hue = get_pixel_color
    Rails.logger.info( "Hue: #{hue}" )
    Rails.logger.info( "Checking range: #{range}" )
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
    Rails.logger.info( "Getting image" )
    image = Magick::Image.read('http://trash.local/lastsnap.jpg').first
    Rails.logger.info( "Saving image" )
    image.write('pokemon.jpg')
    image
  end
end
