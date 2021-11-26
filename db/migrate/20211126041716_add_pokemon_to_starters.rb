class AddPokemonToStarters < ActiveRecord::Migration[5.2]
  def change
    add_column :starters, :piplup_total, :integer
    add_column :starters, :turtwig_total, :integer
    add_column :starters, :chimchar_total, :integer

    add_column :starters, :pokemon, :string, default: 'Piplup'
  end
end
