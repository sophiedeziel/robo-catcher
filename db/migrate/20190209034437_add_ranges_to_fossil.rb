class AddRangesToFossil < ActiveRecord::Migration[5.2]
  def change
    #['Omanyte', 'Pterodactyl', 'Kebuto']

    add_column :fossils, :omanyte_range_min, :integer, default: 215
    add_column :fossils, :omanyte_range_max, :integer, default: 255

    add_column :fossils, :pterodactyl_range_min, :integer, default: 215
    add_column :fossils, :pterodactyl_range_max, :integer, default: 255

    add_column :fossils, :kabuto_range_min, :integer, default: 215
    add_column :fossils, :kabuto_range_max, :integer, default: 255
  end
end
