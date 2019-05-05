require 'json'
require 'active_support/core_ext/hash/keys'

class Config
  attr_accessor :raw_settings, :hardware, :setting, :reset, :fossil, :alolan, :tweet_template

  def initialize
    json = File.read('tmp/settings.json')
    @raw_settings = JSON.parse(json)
    @hardware = @raw_settings["hardware"].symbolize_keys
    @setting =  @raw_settings["setting"].symbolize_keys
    @reset =  @raw_settings["reset"].symbolize_keys
    @fossil =  @raw_settings["fossil"].symbolize_keys
    @alolan =  @raw_settings["alolan"].symbolize_keys
    @tweet_template =  @raw_settings["tweet_template"].map &:symbolize_keys
  end
end
