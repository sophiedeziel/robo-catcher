require 'arduino_firmata'
require 'active_support/core_ext/hash/except'

class Hardware
  def initialize(normal_mode_led:, reset_mode_led:, shiny_detected_led:, not_shiny_detected_led:,
                 a_pin:, a_led_pin:, a_standby_angle:, a_press_angle:, a_up_angle:,
                 x_pin: , x_led_pin:, x_standby_angle:, x_press_angle:, x_up_angle:,
                 home_pin:, home_led_pin:, home_standby_angle:, home_press_angle:, home_up_angle:,
                 up_pin:, up_standby_angle:, up_press_angle:, up_up_angle:,
                 right_pin:, right_standby_angle:, right_press_angle:, right_up_angle:,
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
        up: { pin: up_pin, standby_angle: up_standby_angle, press_angle: up_press_angle, up_angle: up_up_angle },
        right: { pin: right_pin, standby_angle: right_standby_angle, press_angle: right_press_angle, up_angle: right_up_angle },
    }

    begin
      puts "Se connecte au Arduino"
      @arduino  = ArduinoFirmata.connect
      puts "Arduino connecté"
    rescue ArduinoFirmata::Error
      puts "Error: the arduino board was not found"
      exit
    end
  end

  def press(button, delay)
    raise_motors if delay < 0
    light(button, true)
    motor_angle(button, :press_angle)
    sleep 0.4
    motor_angle(button, :standby_angle)
    light(button, false)

    sleep delay / 1000.0
  end

  def motor_angle(motor, angle)
    @arduino.servo_write @servo[motor][:pin], angle.is_a?(Symbol) ? @servo[motor][angle] : angle
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
      light(button, true)
      motor_angle(button, :up_angle)
      sleep 0.3
      light(button, false)
    end
    @led.except(:shiny).keys.each do |pin|
      light pin, false
    end
  end

  def lower_motors
    @servo.each do |button, hash|
      light(button, true)
      motor_angle(button, :standby_angle)
      sleep 0.3
      light(button, false)
    end
  end
end
