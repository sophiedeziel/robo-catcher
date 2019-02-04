LED = {
  normal: 8,
  reset: 7,
  a: 4,
  x: 5,
  home: 6,
  shiny: 3,
  not_shiny: 2,
}

# SERVO = {
#   a: {pin: 11, press_angle: 0, up_angle: 90},
#   x: {pin:, press_angle: , up_angle: },
#   home: {pin:, press_angle: , up_angle: },
# }
#
# Input A, Delay_1
#  Input A, Delay_2
#  Input A, Delay_3
#  Input A, Delay_4
#  Input A, Delay_5
#  Input A, Delay_6
#  Input A, Delay_7
#  Input A, Delay_8
#  Input A, Delay_9
#  Input A, Delay_10
#  Input A, Delay_11
#  Input A, Delay_12
#  Input A, Delay_13
#  Input A, Delay_13b (if new stat)
#  Bool Camera_Shiny
#  if Camera_Shiny = true
# 	END
#  else
#  Input A, Delay_14
#  Input A, Delay_15
#  int_fossil --
#  if int_fossil > 0
# 	GOTO Main_Loop_Fossil
#  else
#  Input Home, Delay_16
#  Input X, Delay_17
#  Input A, Delay_18
#  Input A, Delay_19
#  Input A, Delay_20
#  Input A, Delay_21
#  Input A, Delay_22
#  Input A, Delay_23
#  Input A, Delay_24
#  Input A, Delay_25
#  Input A, Delay_26
#
#  Goto Main_loop_Fossil
namespace :robo_catcher do
  desc "Script to get Omanyte"
  task :fossil => :environment do
    @fossil = Fossil.last
    @arduino = ArduinoFirmata.connect

    @fossil.number.times do
      normal_mode do
        press(:a, @fossil.delay_1)
        press(:a, @fossil.delay_2)
        press(:a, @fossil.delay_3)
        press(:a, @fossil.delay_4)
        press(:a, @fossil.delay_5)
        press(:a, @fossil.delay_6)
        press(:a, @fossil.delay_7)
        press(:a, @fossil.delay_8)
        press(:a, @fossil.delay_9)
        press(:a, @fossil.delay_10)
        press(:a, @fossil.delay_11)
        press(:a, @fossil.delay_12)
        press(:a, @fossil.delay_13)

        press(:a, @fossil.delay_13b) if true

        if shiny?
          @arduino.digital_write LED[:shiny], true
          break;
        else
          @arduino.digital_write LED[:not_shiny], true
          press(:a, @fossil.delay_14)
          press(:a, @fossil.delay_15)
        end

        LED.slice(:shiny, :not_shiny).values.each do |pin|
          @arduino.digital_write pin, false
        end

      end
    end

    reseting do
      press(:home, @fossil.delay_16)
      press(:x, @fossil.delay_17)
      press(:a, @fossil.delay_18)
      press(:a, @fossil.delay_19)
      press(:a, @fossil.delay_20)
      press(:a, @fossil.delay_21)
      press(:a, @fossil.delay_22)
      press(:a, @fossil.delay_23)
      press(:a, @fossil.Delay_24)
      press(:a, @fossil.delay_25)
      press(:a, @fossil.delay_26)
    end
  end

  def shiny?
    rand(10) == 10
  end

  def get_pixel_color
    img   = get_screenshot
    img.quantize(256)
    pixel = img.pixel_color(320,240)
    hex   = pixel.to_color
  end

  def get_screenshot
    Magick::Image.read('http://localhost:8081/current').first
  end

  def press(button, delay)
    case button
    when :a
      @arduino.digital_write LED[:a], true
    when :x
      @arduino.digital_write LED[:x], true
    when :home
      @arduino.digital_write LED[:home], true
    end
    sleep 0.5
    LED.slice(:a, :x, :home).values.each do |pin|
      @arduino.digital_write pin, false
    end
    sleep delay / 1000.0
  end

  def normal_mode
    @arduino.digital_write LED[:normal], true
    yield
  ensure
    @arduino.digital_write LED[:normal], false
  end

  def reseting
    @arduino.digital_write LED[:reset], true
    yield
  ensure
    @arduino.digital_write LED[:reset], false
  end
end
