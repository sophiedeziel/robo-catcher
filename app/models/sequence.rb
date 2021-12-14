class Sequence < ApplicationRecord
  has_many :instructions, dependent: :destroy

  def first_instruction
    Instruction.where(sequence_id: id).find(first_instruction_id)
  end

  def instructions
    Instruction.order_instructions(first_instruction, super)
  end
end
