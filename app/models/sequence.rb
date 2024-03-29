class Sequence < ApplicationRecord
  has_many :instructions, dependent: :destroy
  has_many :registers, dependent: :destroy
  has_many :pokemons
  belongs_to :current_pokemon, class_name: "Pokemon"

  def first_instruction
    return if first_instruction_id.nil?
    Instruction.where(sequence_id: id).find(first_instruction_id)
  end

  def instructions
    Instruction.order_instructions(first_instruction, super)
  end
end
