class Sequence < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_one :first_instruction, class_name: "Instruction"

  def instructions
    Instruction.order_instructions(first_instruction, super)
  end
end
