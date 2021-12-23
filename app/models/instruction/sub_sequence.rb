class Instruction
  class SubSequence < Instruction
    def human_name
      "Sous-séquence"
    end
    
    def sequence_id
      params["sequence_id"].to_i
    end
  end
end