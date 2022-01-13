class Instruction
  class Wait < Instruction
    def human_name
      "Attendre"
    end
    
    def time
      params["time"].to_i
    end

    def execute(_robot)
      super do
        sleep time / 1000
      end
    end
  end
end