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

    def register
      Register.find(register_id)
    end

    def execute(robot)
      super do
        register.update(value: register.value + amount)
        sleep 0.5
      end
    end
  end
end