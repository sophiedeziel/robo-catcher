class Instruction
  class ButtonPress < Instruction
    def human_name
      "Bouton"
    end
    
    def label
      params["label"].to_sym
    end
  end
end