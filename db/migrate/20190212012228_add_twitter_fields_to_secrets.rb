class AddTwitterFieldsToSecrets < ActiveRecord::Migration[5.2]
  def change
    #  config.consumer_key        = "YOUR_CONSUMER_KEY"
    #  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
    #  config.access_token        = "YOUR_ACCESS_TOKEN"
    #  config.access_token_secret = "YOUR_ACCESS_SECRET"

    add_column :secrets, :twitter_consumer_key,    :string
    add_column :secrets, :twitter_consumer_secret, :string
    add_column :secrets, :twitter_access_token,    :string
    add_column :secrets, :twitter_token_secret,    :string
  end
end
