class Instruction
  class Wait < Instruction
    def human_name
      "Attendre"
    end
    
    def time
      params["time"].to_i
    end
  end
end