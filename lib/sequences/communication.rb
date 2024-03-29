class Communication
  def initialize
    Rails.logger.info "Initialiser les communications"
    @setting = Setting.first_or_create
    cloudinary_config
    @twilio_client = Twilio::REST::Client.new(@setting.twilio_sid, @setting.twilio_token)
  end

  def send_message(attempt = nil)

    image = attempt.present? ? attempt.image : send_image

    Rails.logger.info "Envoi du message"
    @twilio_client.api.account.messages.create(
      from: '+18153627857',
      to: @setting.numero,
      body: "On a un #{attempt&.pokemon} shiny!!!",
      media_url: image,
    )
  end

  def send_image
    Rails.logger.info "Envoi de l'image sur cloudinary"
    Cloudinary::Uploader.upload(Webcam::IMAGE_PATH, :folder => "TRASH", :overwrite => true)['url']
  end

  private

  def cloudinary_config
    Rails.logger.info "Configurer Cloudinary"
    Cloudinary.config do |config|
      config.cloud_name = @setting.cloudinary_cloud
      config.api_key    = @setting.cloudinary_key
      config.api_secret = @setting.cloudinary_secret
      config.secure     = true
      config.cdn_subdomain = true
    end
  end
end