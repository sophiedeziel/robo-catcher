
class ExportConfigJob < ApplicationJob
  queue_as :default

  def perform
    @hardware       = Hardware.instance
    @setting        = Setting.instance
    @reset          = Reset.instance
    @fossil         = Fossil.instance
    @alolan         = Alolan.instance
    @tweet_template = TweetTemplate.all

    save_hash
  end

  private

  def generate_big_hash
    hash = {}
    hash[:hardware]       = @hardware.as_json
    hash[:setting]        = @setting.as_json
    hash[:reset]          = @reset.as_json
    hash[:fossil]         = @fossil.as_json
    hash[:alolan]         = @alolan.as_json
    hash[:tweet_template] = @tweet_template.as_json
    hash
  end

  def save_hash
    File.open("tmp/settings.json","w") do |f|
      f.write(generate_big_hash.to_json)
    end
  end
end
