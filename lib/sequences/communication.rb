class Communication
  def initialize
    @setting = Setting.instance
    cloudinary_config
    @twilio_client = Twilio::REST::Client.new(@setting.twilio_sid, @setting.twilio_token)
  end

  def send_message
    @twilio_client.api.account.messages.create(
      from: '+18153627857',
      to: @setting.numero,
      body: 'On a un shiny!!!',
      media_url: send_image,
    )
  end

  private

  def send_image
    Cloudinary::Uploader.upload("pokemon.jpg", :folder => "TRASH", :overwrite => true)['url']
  end

  def cloudinary_config
    Rails.logger.info "Configurer Cloudinary"
    Cloudinary.config do |config|
      config.cloud_name = 'duj3xcocx'
      config.api_key    = @setting.cloudinary_key
      config.api_secret = @setting.cloudinary_secret
      config.secure     = true
      config.cdn_subdomain = true
    end
  end
end