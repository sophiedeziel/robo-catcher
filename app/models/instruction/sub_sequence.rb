class Instruction
  class SubSequence < Instruction
    def human_name
      "Sous-séquence"
    end
    
    def sequence_id
      params["sequence_id"].to_i
    end

    def execute(robot)
      super do
        robot.run_sequence_instructions(sub_sequence.instructions.first)
      end
    end

    def sub_sequence
      Sequence.find(sequence_id)
    end
  end
end