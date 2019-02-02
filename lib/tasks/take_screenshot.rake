# irb(main):001:0> equire 'rmagick'
# NoMethodError: undefined method `equire' for main:Object
# Did you mean?  require
# 	from (irb):1
# 	from /usr/bin/irb:11:in `<main>'
# irb(main):002:0> require 'rmagick'
# => true
# irb(main):003:0> img = Magick::Image.read('http://192.168.0.110:8081/current')
# => [http://192.168.0.110:8081/current=>current JPEG 640x480 640x480+0+0 DirectClass 8-bit 450kb]
# irb(main):004:0> img.pixel_color(320,240)
# NoMethodError: undefined method `pixel_color' for #<Array:0xefe2f0>
# 	from (irb):4
# 	from /usr/bin/irb:11:in `<main>'
# irb(main):005:0> img.quantize(number_colors = 256)
# NoMethodError: undefined method `quantize' for #<Array:0xefe2f0>
# 	from (irb):5
# 	from /usr/bin/irb:11:in `<main>'
# irb(main):006:0> img
# => [http://192.168.0.110:8081/current=>current JPEG 640x480 640x480+0+0 DirectClass 8-bit 450kb]
# irb(main):007:0> img.first
# => http://192.168.0.110:8081/current=>current JPEG 640x480 640x480+0+0 DirectClass 8-bit 450kb
# irb(main):008:0> img.first.quantize
# => http://192.168.0.110:8081/current=>current JPEG 640x480 640x480+0+0 PseudoClass 256c 8-bit
# irb(main):009:0> img.first.pixel_color(320,240)
# => #<Magick::Pixel:0xe3a318>
# irb(main):010:0> pixel = _
# => #<Magick::Pixel:0xe3a318>
# irb(main):011:0> pixel
# => #<Magick::Pixel:0xe3a318>
# irb(main):012:0> pixel.red
# => 38807
# irb(main):013:0> pixel.green
# => 39578
# irb(main):014:0> pixel.blue
# => 41377
# irb(main):015:0> img.first.quantize(256)
# => http://192.168.0.110:8081/current=>current JPEG 640x480 640x480+0+0 PseudoClass 256c 8-bit
# irb(main):016:0> img.first.pixel_color(320,240)
# => #<Magick::Pixel:0xd2a410>
# irb(main):017:0> pixel = _
# => #<Magick::Pixel:0xd2a410>
# irb(main):018:0> pixel.blue
# => 41377
# irb(main):019:0> img.first.pixel_color(0,0)
# => #<Magick::Pixel:0xd1c538>
# irb(main):020:0> img.first.pixel_color(0,0).hash
# => 1802795520
# irb(main):021:0> img.first.pixel_color(0,0).to_color
# => "#D6D6E8E8F4F4"
# irb(main):022:0> img.first.pixel_color(100,100).to_color
# => "#F0F0ECECE9E9"
# irb(main):024:0>
#
namespace :robo_catcher do
  desc "Script to get Omanyte"
  task :omanyte => :environment do

    get_pixel_color
  end


  def get_pixel_color
    img = get_screenshot
    img.quantize(256)
    pixel = img.pixel_color(320,240)
    hex = pixel.to_color
  end

  def get_screenshot
    Magick::Image.read('http://localhost:8081/current').first
  end
end
