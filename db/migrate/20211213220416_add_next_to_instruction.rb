class AddNextToInstruction < ActiveRecord::Migration[6.1]
  def change
    add_column :instructions, :next_intruction_id, :integer, null: true
  end
end
