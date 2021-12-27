class Register < ApplicationRecord
  belongs_to :sequence

  def destroy
    return false if Instruction.where(sequence: sequence).find { |instruction| instruction.params["register_id"].to_i == id }.present?
    super
  end
end
