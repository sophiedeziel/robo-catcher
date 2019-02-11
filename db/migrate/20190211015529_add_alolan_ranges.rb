class AddAlolanRanges < ActiveRecord::Migration[5.2]
  def change
    add_column :alolans, :grimer_range_min, :integer
    add_column :alolans, :grimer_range_max, :integer
    add_column :alolans, :sandshrew_range_min, :integer
    add_column :alolans, :sandshrew_range_max, :integer
    add_column :alolans, :raichu_range_min, :integer
    add_column :alolans, :raichu_range_max, :integer
    add_column :alolans, :vulpix_range_min, :integer
    add_column :alolans, :vulpix_range_max, :integer
    add_column :alolans, :diglett_range_min, :integer
    add_column :alolans, :diglett_range_max, :integer
    add_column :alolans, :geodude_range_min, :integer
    add_column :alolans, :geodude_range_max, :integer
    add_column :alolans, :exeggutor_range_min, :integer
    add_column :alolans, :exeggutor_range_max, :integer
    add_column :alolans, :marowak_range_min, :integer
    add_column :alolans, :marowak_range_max, :integer
    add_column :alolans, :meowth_range_min, :integer
    add_column :alolans, :meowth_range_max, :integer

  end
end
