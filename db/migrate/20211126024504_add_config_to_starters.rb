class AddConfigToStarters < ActiveRecord::Migration[5.2]
  def change
    add_column :starters, :chimchar_range_min, :integer
    add_column :starters, :chimchar_range_max, :integer
    add_column :starters, :turtwig_range_min, :integer
    add_column :starters, :turtwig_range_max, :integer
    add_column :starters, :piplup_range_min, :integer, default: 202
    add_column :starters, :piplup_range_max, :integer, default: 220

    add_column :starters, :delay_1, :integer, default: 2000
    add_column :starters, :delay_2, :integer, default: 4000
    add_column :starters, :delay_3, :integer, default: 2000
    add_column :starters, :delay_4, :integer, default: 1000
    add_column :starters, :delay_5, :integer, default: 1000
    add_column :starters, :delay_6, :integer, default: 1000
    add_column :starters, :delay_7, :integer, default: 1000
    add_column :starters, :delay_8, :integer, default: 2000
    add_column :starters, :delay_9, :integer, default: 1000
    add_column :starters, :delay_10, :integer, default: 1000
    add_column :starters, :delay_11, :integer, default: 1000
    add_column :starters, :delay_12, :integer, default: 1000
    add_column :starters, :delay_13, :integer, default: 5000
    add_column :starters, :delay_14, :integer, default: 4000
    add_column :starters, :delay_15, :integer, default: 5000
    add_column :starters, :delay_16, :integer, default: 3500
    add_column :starters, :delay_17, :integer, default: 1000
    add_column :starters, :delay_18, :integer, default: 1000
    add_column :starters, :delay_19, :integer, default: 1000
    add_column :starters, :delay_20, :integer, default: 5500
    add_column :starters, :delay_21, :integer, default: 1000
    add_column :starters, :delay_22, :integer, default: 1000
    add_column :starters, :delay_23, :integer, default: 5000
    add_column :starters, :delay_24, :integer, default: 1000
    add_column :starters, :delay_25, :integer, default: 6000
    add_column :starters, :delay_26, :integer, default: 2000
    add_column :starters, :delay_27, :integer, default: 1000
    add_column :starters, :delay_28, :integer, default: 1000
    add_column :starters, :delay_29, :integer, default: 1000
    add_column :starters, :delay_30, :integer, default: 1000
    add_column :starters, :delay_31, :integer, default: 18000
  end
end
