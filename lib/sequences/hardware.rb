require 'arduino_firmata'

class Hardware
  def initialize(normal_mode_led:, reset_mode_led:, shiny_detected_led:, not_shiny_detected_led:,
                 a_pin:, a_led_pin:, a_standby_angle:, a_press_angle:, a_up_angle:,
                 x_pin: , x_led_pin:, x_standby_angle:, x_press_angle:, x_up_angle:,
                 home_pin:, home_led_pin:, home_standby_angle:, home_press_angle:, home_up_angle:,
                 **args)
    @led = {
      normal: normal_mode_led,
      reset: reset_mode_led,
      a: a_led_pin,
      x: x_led_pin,
      home: home_led_pin,
      shiny: shiny_detected_led,
      not_shiny: not_shiny_detected_led
    }

    @servo =
      {
        a:    { pin: a_pin, standby_angle: a_standby_angle, press_angle: a_press_angle, up_angle: a_up_angle },
        x:    { pin: x_pin, standby_angle: x_standby_angle, press_angle: x_press_angle, up_angle: x_up_angle },
        home: { pin: home_pin, standby_angle: home_standby_angle, press_angle: home_press_angle, up_angle: home_up_angle },
    }

    begin
      @arduino  = ArduinoFirmata.connect
    rescue ArduinoFirmata::Error
      puts "Error: the arduino board was not found"
      exit
    end
  end

  def press(button, delay)
    raise_motors if delay < 0
    light(button, true)
    @arduino.servo_write @servo[button][:pin], @servo[button][:press_angle]
    sleep 0.4
    @arduino.servo_write @servo[button][:pin], @servo[button][:standby_angle]
    light(button, false)

    sleep delay / 1000.0
  end

  def light(led, value)
    @arduino.digital_write @led[led], value
  end

  def normal_mode
    light(:normal, true)
    yield
  ensure
    light(:normal, false)
  end

  def reseting
    light(:reset, true)
    yield
  ensure
    light(:reset, false)
  end

  def raise_motors
    @servo.each do |button, hash|
      @arduino.servo_write hash[:pin], hash[:up_angle]
    end
    @led.except(:shiny).values.each do |pin|
      @arduino.digital_write pin, false
    end
    exit
  end
end
