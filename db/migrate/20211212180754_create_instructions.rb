class CreateInstructions < ActiveRecord::Migration[6.1]
  def change
    create_table :instructions do |t|
      t.string :type
      t.text :comment
      t.text :params, default: "{}"

      t.integer :order, default: 0
      t.references :sequence

      t.timestamps
    end
  end
end
