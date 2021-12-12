class Instruction < ApplicationRecord
  belongs_to :sequence
  
  def params
    JSON.parse(self[:params])
  end

  def params=(params)
    self[:params] = params.to_json
  end
end
