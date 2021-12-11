class Attempt < ApplicationRecord
  after_save :broadcast_attempt

  private

  def broadcast_attempt
    ActionCable.server.broadcast("attempts", self.serializable_hash)
  end
end
