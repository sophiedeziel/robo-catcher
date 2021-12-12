class Instruction
  class Wait < Instruction
    def time
      params["time"].to_i
    end
  end
end