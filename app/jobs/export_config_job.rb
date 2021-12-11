
class ExportConfigJob < ApplicationJob
  queue_as :default

  def perform
    @hardware       = Hardware.first_or_create
    @setting        = Setting.first_or_create
    @reset          = Reset.first_or_create
    @fossil         = Fossil.first_or_create
    @alolan         = Alolan.first_or_create
    @starter        = Starter.first_or_create
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
    hash[:starter]        = @starter.as_json
    hash[:tweet_template] = @tweet_template.as_json
    hash
  end

  def save_hash
    File.open("tmp/settings.json","w") do |f|
      f.write(generate_big_hash.to_json)
    end
  end
end
