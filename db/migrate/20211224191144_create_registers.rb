class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.boolean :hide
      t.references :sequence

      t.timestamps
    end
  end
end
