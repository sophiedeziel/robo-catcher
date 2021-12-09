class Starter < ApplicationRecord
  include SingletonModel

  after_save :broadcast_stats

  private

  def broadcast_stats
    ActionCable.server.broadcast("starter", self.serializable_hash)
  end
end