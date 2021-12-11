class AttemptChannel < ApplicationCable::Channel
  def subscribed
    stream_from "attempts"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
