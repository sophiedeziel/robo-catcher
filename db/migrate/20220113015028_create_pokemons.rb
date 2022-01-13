class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.references :sequence, null: false, foreign_key: true
      t.integer :hue
      t.integer :tolerance
      t.string :image

      t.timestamps
    end
  end
end
