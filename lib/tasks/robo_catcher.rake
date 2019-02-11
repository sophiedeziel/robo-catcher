# frozen_string_literal: true

namespace :robo_catcher do
  desc "Descendre les moteurs"
  task start: :environment do
    @secret = Secret.last

    Cloudinary.config do |config|
      config.cloud_name = 'sophiedeziel'
      config.api_key    = @secret.cloudinary_key
      config.api_secret = @secret.cloudinary_secret
      config.secure     = true
      config.cdn_subdomain = true
    end

    Rails.logger.info "start"
    @hardware = Hardware.last
    @arduino  = ArduinoFirmata.connect
    @fossil   = Fossil.last
    @alolan   = Alolan.last

    Signal.trap("SIGHUP") do
      Rails.logger.info "\nShutting down gracefully..."
      raise_motors
    end

    servo.each do |button, hash|
      @arduino.servo_write hash[:pin], hash[:standby_angle]
      sleep 0.5
    end
  end

  desc "Séquence de reset"
  task reset: :environment do
    Rails.logger.info "reset"
    @hardware ||= Hardware.last
    @arduino  ||= ArduinoFirmata.connect
    @reset = Reset.last
    reseting do
      press(:home, @reset.home)
      press(:x, @reset.x)
      press(:a, @reset.delay_1)
      press(:a, @reset.delay_2)
      press(:a, @reset.delay_3)
      press(:a, @reset.delay_4)
      press(:a, @reset.delay_5)
      press(:a, @reset.delay_6)
      press(:a, @reset.delay_7)
      press(:a, @reset.delay_8)
      press(:a, @reset.delay_9)
    end
  end

  desc "Lorsqu'un shiny est trouvé"
  task shiny: :environment do
    Rails.logger.info "SHINY"
    @arduino.digital_write led[:shiny], true
    send_message
    raise_motors
  end

  desc 'Script to get a fossil pokemon'
  task fossil: :environment do
    Rails.logger.info "start fossil hunt"
    Rake::Task['robo_catcher:start'].invoke
    @fossil.run_tries = 0

    loop do
      @fossil.number.times do
        @fossil.run_tries += 1
        @fossil.total_tries += 1
        @fossil.save

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

          Rake::Task['robo_catcher:shiny'].invoke if fossil_shiny?

          @arduino.digital_write led[:not_shiny], true
          press(:a, @fossil.delay_13b)
          press(:a, @fossil.delay_14)
          press(:a, @fossil.delay_15)
          @arduino.digital_write led[:not_shiny], false
        end
      end

      Rake::Task['robo_catcher:reset'].invoke

    end
  end

  desc 'Script to get an alolan pokemon'
  task alolan: :environment do
    Rails.logger.info "start alolan hunt"
    Rake::Task['robo_catcher:start'].invoke
    @alolan.run_tries = 0

    loop do
      @alolan.number.times do
        @alolan.run_tries += 1
        @alolan.total_tries += 1
        @alolan.save

        normal_mode do
          # A
          press(:a, @alolan.delay_1)
          # Texte d'intro
          # A ou X
          press(:a, @alolan.delay_2)
          # Texte d'intro 2 si nécessaire
          # A ou X

          press(:a, @alolan.delay_3) if @alolan.pokemon.in? ['Grimer', 'Sandshrew', 'Raichu', 'Vulpix', 'Exeggutor', 'Marowak', 'Meowth']
          # Oui ou Non
          # A
          press(:a, @alolan.delay_4)
          # Liste des choix
          # A
          press(:a, @alolan.delay_5)
          # Sélectionner pour l'échange
          # A
          press(:a, @alolan.delay_6)
          # Procéder à l'échange
          # A
          press(:a, @alolan.delay_7)
          # Texte de Confirmation
          # A ou X
          press(:a, @alolan.delay_8)
          # Animation d'envoie
          # A ou X
          Rake::Task['robo_catcher:shiny'].invoke if alolan_shiny?

          @arduino.digital_write led[:not_shiny], true
          sleep @alolan.delay_9 / 1000.0
          # exception
          # A ou X
          press(:a, @alolan.delay_10)
          # Texte de Résultat
          # A ou X
          press(:a, @alolan.delay_11)
          # Texte de Résultat 2 si nécessaire
          # A ou X
          press(:a, @alolan.delay_12) if @alolan.pokemon.in? ['Sandshrew', 'Raichu', 'Vulpix', 'Diglett', 'Geodude', 'Exeggutor', 'Marowak']
          @arduino.digital_write led[:not_shiny], false
        end
      end

      Rake::Task['robo_catcher:reset'].invoke
    end
  end

  def fossil_shiny?
    hue = get_pixel_color
    Rails.logger.info "Hue: #{hue}"
    case @fossil.pokemon
    when 'Omanyte'
      hue.in? (@fossil.omanyte_range_min..@fossil.omanyte_range_max)
    when 'Pterodactyl'
      hue.in? (@fossil.pterodactyl_range_min..@fossil.pterodactyl_range_max)
    when 'Kabuto'
      hue.in? (@fossil.kabuto_range_min..@fossil.kabuto_range_max)
    end
  end


  def alolan_shiny?
    hue = get_pixel_color
    Rails.logger.info "Hue: #{hue}"
    case @alolan.pokemon
    when 'Rattata'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Grimer'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Sandshrew'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Raichu'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Vulpix'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Diglett'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Geodude'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Exeggutor'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Marowak'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    when 'Meowth'
      hue.in? (@alolan.rattata_range_min..@alolan.rattata_range_max)
    end
  end

  def get_pixel_color
    img = get_screenshot
    img.quantize(256)
    pixel = img.pixel_color(320, 240)
    hex   = pixel.to_hsla.first
  end

  def get_screenshot
    image = Magick::Image.read('http://localhost:8081/current').first
    image.write('pokemon.jpg')
    image
  end

  def press(button, delay)
    Rails.logger.info "Press #{button}"
    raise_motors if delay < 0
    @arduino.digital_write led[button], true

    @arduino.servo_write servo[button][:pin], servo[button][:press_angle]
    sleep 0.4
    @arduino.servo_write servo[button][:pin], servo[button][:standby_angle]

    @arduino.digital_write led[button], false

    sleep delay / 1000.0
  end

  def normal_mode
    @arduino.digital_write led[:normal], true
    yield
  ensure
    @arduino.digital_write led[:normal], false
  end

  def reseting
    @arduino.digital_write led[:reset], true
    yield
  ensure
    @arduino.digital_write led[:reset], false
  end

  def raise_motors
    servo.each do |button, hash|
      @arduino.servo_write hash[:pin], hash[:up_angle]
    end
    led.except(:shiny).values.each do |pin|
      @arduino.digital_write pin, false
    end
    exit
  end

  def twilio_client
    @client ||= Twilio::REST::Client.new(@secret.twilio_sid, @secret.twilio_token)
  end

  def send_message
    twilio_client.api.account.messages.create(
      from: '+14388060508',
      to: @secret.numero,
      body: 'On a un shiny!!!',
      media_url: send_image,
    )
  end

  def send_image
    Cloudinary::Uploader.upload("pokemon.jpg", :folder => "TRASH", :overwrite => true)['url']
  end

  def led
    {
      normal: @hardware.normal_mode_led,
      reset: @hardware.reset_mode_led,
      a: @hardware.a_led_pin,
      x: @hardware.x_led_pin,
      home: @hardware.home_led_pin,
      shiny: @hardware.shiny_detected_led,
      not_shiny: @hardware.not_shiny_detected_led
    }
  end

  def servo
    {
      a:    { pin: @hardware.a_pin, standby_angle: @hardware.a_standby_angle, press_angle: @hardware.a_press_angle, up_angle: @hardware.a_up_angle },
      x:    { pin: @hardware.x_pin, standby_angle: @hardware.x_standby_angle, press_angle: @hardware.x_press_angle, up_angle: @hardware.x_up_angle },
      home: { pin: @hardware.home_pin, standby_angle: @hardware.home_standby_angle, press_angle: @hardware.home_press_angle, up_angle: @hardware.home_up_angle },
    }
  end
end
