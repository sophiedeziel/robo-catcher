class CreateHardwares < ActiveRecord::Migration[5.2]
  def change
    create_table :hardwares do |t|
      t.integer :normal_mode_led, default: 8
      t.integer :reset_mode_led, default: 7

      t.integer :shiny_detected_led, default: 3
      t.integer :not_shiny_detected_led, default: 2

      t.integer :a_pin,           default: 10
      t.integer :a_led_pin,       default: 4
      t.integer :a_standby_angle, default: 98
      t.integer :a_press_angle,   default: 108
      t.integer :a_up_angle,      default: 20

      t.integer :x_pin,           default: 11
      t.integer :x_led_pin,       default: 5
      t.integer :x_standby_angle, default: 90
      t.integer :x_press_angle,   default: 103
      t.integer :x_up_angle,      default: 20

      t.integer :home_pin,           default: 9
      t.integer :home_led_pin,       default: 6
      t.integer :home_standby_angle, default: 90
      t.integer :home_press_angle,   default: 125
      t.integer :home_up_angle,      default: 20

      t.timestamps
    end
  end
end
