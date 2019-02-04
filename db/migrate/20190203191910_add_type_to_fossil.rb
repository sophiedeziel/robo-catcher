class AddTypeToFossil < ActiveRecord::Migration[5.2]
  def change
    add_column :fossils, :pokemon, :string, default: 'Omanyte'
  end
end
