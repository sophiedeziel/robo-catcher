require 'arduino_firmata'
require 'active_support/core_ext/hash/except'

class HardwareConfig
  def initialize()
    @config = Hardware.first_or_create
    @led = {
      normal: @config.normal_mode_led,
      reset: @config.reset_mode_led,
      a: @config.a_led_pin,
      x: @config.x_led_pin,
      up: @config.a_led_pin,
      right: @config.x_led_pin,
      home: @config.home_led_pin,
      shiny: @config.shiny_detected_led,
      not_shiny: @config.not_shiny_detected_led
    }

    @servo =
      {
        a:    { 
          pin: @config.a_pin, 
          standby_angle: @config.a_standby_angle, 
          press_angle: @config.a_press_angle, 
          up_angle: @config.a_up_angle 
        },
        x:    { 
          pin: @config.x_pin, 
          standby_angle: @config.x_standby_angle, 
          press_angle: @config.x_press_angle, 
          up_angle: @config.x_up_angle 
        },
        home: { 
          pin: @config.home_pin, 
          standby_angle: @config.home_standby_angle, 
          press_angle: @config.home_press_angle, 
          up_angle: @config.home_up_angle 
        },
        up: { 
          pin: @config.up_pin, 
          standby_angle: @config.up_standby_angle, 
          press_angle: @config.up_press_angle, 
          up_angle: @config.up_up_angle 
        },
        right: { 
          pin: @config.right_pin, 
          standby_angle: @config.right_standby_angle, 
          press_angle: @config.right_press_angle, 
          up_angle: @config.right_up_angle 
        },
    }

    begin
      Rails.logger.info "Se connecte au Arduino"
      @arduino  = ArduinoFirmata.connect
      Rails.logger.info "Arduino connecté"
    rescue ArduinoFirmata::Error
      Rails.logger.info "Error: the arduino board was not found"
    end
  end

  def press(button, delay)
    raise_motors if delay < 0
    ActionCable.server.broadcast("trash", {button => "pressed"})
    light(button, true)
    motor_angle(button, :press_angle)
    sleep 0.4
    motor_angle(button, :standby_angle)
    light(button, false)
    ActionCable.server.broadcast("trash", {button => "released"})

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

  def reset_lights
    @led.each do |led, hash|
      light(led, false)
    end
  end
end
