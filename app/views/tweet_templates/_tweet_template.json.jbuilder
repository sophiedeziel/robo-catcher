json.extract! tweet_template, :id, :event, :message, :created_at, :updated_at
json.url tweet_template_url(tweet_template, format: :json)
