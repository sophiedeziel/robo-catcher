class Instruction < ApplicationRecord
  belongs_to :sequence

  def to_partial_path
    super.split('/')
    .tap { |l| l.shift(2) } 
    .prepend('instructions')
    .join('/')
  end
  
  def params
    JSON.parse(self[:params])
  end

  def params=(params)
    self[:params] = params.to_json
  end

  def next_instruction
    Instruction.find(next_intruction_id) if next_intruction_id
  end

  def execute
    ActionCable.server.broadcast("trash", {"instructionStart" => "instruction-#{self.id}"})
    yield
    ActionCable.server.broadcast("trash", {"instructionFinish" => "instruction-#{self.id}"})
  end

  def destroy
    self.class.transaction do
      previous = Instruction.find_by(next_intruction_id: id)
      if previous.present?
        previous.update(next_intruction_id: next_intruction_id)
      else
        loop = Instruction::Loop.where(sequence_id: sequence_id).find { |instruction| instruction.params["first_instruction_id"] == id }
        if loop.present?
          new_params = loop.params
          new_params[:first_instruction_id] = next_intruction_id
          loop.update(params: new_params) 
        end

        sequence.update(first_instruction_id: next_intruction_id) if sequence.first_instruction_id == id
      end

      super
    end
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
