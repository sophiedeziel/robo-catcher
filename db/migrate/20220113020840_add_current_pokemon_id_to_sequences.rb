class AddCurrentPokemonIdToSequences < ActiveRecord::Migration[6.1]
  def change
    add_column :sequences, :current_pokemon_id, :integer, null: true, foreign_key: true
  end
end
