class Instruction < ApplicationRecord
  belongs_to :sequence
  
  def params
    JSON.parse(self[:params])
  end

  def params=(params)
    self[:params] = params.to_json
  end

  def execute
    ActionCable.server.broadcast("trash", {"instructionStart" => "instruction-#{self.id}"})
    yield
    ActionCable.server.broadcast("trash", {"instructionFinish" => "instruction-#{self.id}"})
  end
end
