class Instruction
  class IncrementRegister < Instruction
    def human_name
      "Incrémenter"
    end
    
    def register_id
      params["register_id"].to_i
    end

    def amount
      params["amount"].to_i
    end
  end
end