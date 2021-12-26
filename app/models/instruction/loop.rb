class Instruction
  class Loop < Instruction
    def human_name
      "Boucle"
    end

    def first_instruction_id
      params["first_instruction_id"]&.to_i
    end

    def first_instruction
      Instruction.where(sequence_id: sequence_id).find(first_instruction_id) if first_instruction_id
    end
  end
end