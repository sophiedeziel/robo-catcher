class RobotChannel < ApplicationCable::Channel
  def subscribed
      stream_from "trash"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
