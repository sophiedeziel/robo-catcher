class StarterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "starter"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
