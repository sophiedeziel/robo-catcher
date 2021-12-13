class AddFirstInstructionToSequence < ActiveRecord::Migration[6.1]
  def change
    add_column :sequences, :first_instruction_id, :integer, null: true
  end
end
