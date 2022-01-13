class Instruction
  class ButtonPress < Instruction
    def human_name
      "Bouton"
    end
    
    def label
      params["label"]&.to_sym
    end

    def execute(robot)
      super do
        robot.press(label, 400)
      end
    end
  end
end