class AddUpAndRightButtons < ActiveRecord::Migration[5.2]
  def change
    add_column :hardwares, :up_pin, :integer, default: 13
    add_column :hardwares, :up_standby_angle, :integer, default: 90
    add_column :hardwares, :up_press_angle, :integer, default: 100
    add_column :hardwares, :up_up_angle, :integer, default: 20

    add_column :hardwares, :right_pin, :integer, default: 12
    add_column :hardwares, :right_standby_angle, :integer, default: 90
    add_column :hardwares, :right_press_angle, :integer, default: 100
    add_column :hardwares, :right_up_angle, :integer, default: 20
  end
end
