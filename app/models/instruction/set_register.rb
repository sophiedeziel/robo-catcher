class Instruction
  class SetRegister < Instruction
    def self.human_name
      "Assigner"
    end
    
    def register_id
      params["register_id"].to_i
    end

    def value
      params["value"].to_i
    end

    def register
      Register.find(register_id)
    end

    def execute(robot)
      super do
        register.update(value: value)
        sleep 0.1
      end
    end
  end
end