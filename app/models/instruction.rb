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

  def self.order_instructions(first_instruction, instructions)
    return [] if instructions.empty?
    list = [first_instruction]
    while(list.last.next_intruction_id.present?) do
      list << instructions.find { |i| i.id == list.last.next_intruction_id }
    end
    list
  end
end