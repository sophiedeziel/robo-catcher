Trash.define "shiny" do
  Rails.logger.info "ON A UN SHINY!!!!!!!"
  light :shiny, true
  send_message
  # send_shiny_tweet
  run_sequence 'raise_motors'
  exit
end

