class AddDelayToAlolan < ActiveRecord::Migration[5.2]
  def change
    add_column :alolans, :delay_12, :integer, default: 1000
  end
end
