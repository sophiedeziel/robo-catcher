class CreateAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :attempts do |t|
      t.string :pokemon
      t.string :image
      t.integer :detected_hue
      t.integer :hue_min
      t.integer :hue_max
      t.boolean :is_shiny
      t.boolean :is_false_positive

      t.timestamps
    end
  end
end
