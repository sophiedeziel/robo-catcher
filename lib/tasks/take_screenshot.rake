# frozen_string_literal: true

LED = {
  normal: 8,
  reset: 7,
  a: 4,
  x: 5,
  home: 6,
  shiny: 3,
  not_shiny: 2
}.freeze

SERVO = {
  a:    { pin: 10, standby_angle: 95, press_angle: 103, up_angle: 20 },
  x:    { pin: 11, standby_angle: 90,  press_angle: 103, up_angle: 20 },
  home: { pin: 9,  standby_angle: 90, press_angle: 125, up_angle: 20 }
}.freeze

namespace :robo_catcher do
  desc 'Script to get Omanyte'
  task fossil: :environment do

    @fossil = Fossil.last
    @arduino = ArduinoFirmata.connect
    @catched = false

    Signal.trap("SIGHUP") do
      puts "\nShutting down gracefully..."
      raise_motors
    end

    SERVO.each do |button, hash|
      @arduino.servo_write hash[:pin], hash[:standby_angle]
      sleep 0.5
    end

    while  @catched == false
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
          press(:a, @fossil.delay_13b)

          if shiny?
            @arduino.digital_write LED[:shiny], true
            @catched = true
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

      if @catched == false
        reseting do
          press(:home, @fossil.delay_16)
          press(:x, @fossil.delay_17)
          press(:a, @fossil.delay_18)
          press(:a, @fossil.delay_19)
          press(:a, @fossil.delay_20)
          press(:a, @fossil.delay_21)
          press(:a, @fossil.delay_22)
          press(:a, @fossil.delay_23)
          press(:a, @fossil.delay_24)
          press(:a, @fossil.delay_25)
          press(:a, @fossil.delay_26)
        end
      end
    end

  end

  def shiny?
    get_pixel_color > 215
  end

  def get_pixel_color
    img = get_screenshot
    img.quantize(256)
    pixel = img.pixel_color(320, 240)
    hex   = pixel.to_hsla.first
  end

  def get_screenshot
    Magick::Image.read('http://raspberrypi.local:8081/current').first
  end

  def press(button, delay)
    raise_motors if delay < 0
    @arduino.digital_write LED[button], true

    @arduino.servo_write SERVO[button][:pin], SERVO[button][:press_angle]
    sleep 0.4
    @arduino.servo_write SERVO[button][:pin], SERVO[button][:standby_angle]

    @arduino.digital_write LED[button], false

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

  def raise_motors
      SERVO.each do |button, hash|
        @arduino.servo_write hash[:pin], hash[:up_angle]
      end
      LED.values.each do |pin|
        @arduino.digital_write pin, false
      end
      exit
  end
end
