# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_10_215039) do

  create_table "alolans", force: :cascade do |t|
    t.string "pokemon", default: "Rattata"
    t.integer "rattata_range_min"
    t.integer "rattata_range_max"
    t.integer "run_tries", default: 0
    t.integer "total_tries", default: 0
    t.integer "number", default: 10
    t.integer "delay_1", default: 1000
    t.integer "delay_2", default: 1000
    t.integer "delay_3", default: 1000
    t.integer "delay_4", default: 1000
    t.integer "delay_5", default: 1000
    t.integer "delay_6", default: 1000
    t.integer "delay_7", default: 1000
    t.integer "delay_8", default: 1000
    t.integer "delay_9", default: 1000
    t.integer "delay_10", default: 1000
    t.integer "delay_11", default: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fossils", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number", default: 10
    t.integer "delay_1", default: 1000
    t.integer "delay_2", default: 1000
    t.integer "delay_3", default: 1000
    t.integer "delay_4", default: 1000
    t.integer "delay_5", default: 1000
    t.integer "delay_6", default: 1000
    t.integer "delay_7", default: 1000
    t.integer "delay_8", default: 1000
    t.integer "delay_9", default: 1000
    t.integer "delay_10", default: 1000
    t.integer "delay_11", default: 1000
    t.integer "delay_12", default: 1000
    t.integer "delay_13", default: 1000
    t.integer "delay_13b", default: 1000
    t.integer "delay_14", default: 1000
    t.integer "delay_15", default: 1000
    t.integer "delay_16", default: 1000
    t.integer "delay_17", default: 1000
    t.integer "delay_18", default: 1000
    t.integer "delay_19", default: 1000
    t.integer "delay_20", default: 1000
    t.integer "delay_21", default: 1000
    t.integer "delay_22", default: 1000
    t.integer "delay_23", default: 1000
    t.integer "delay_24", default: 1000
    t.integer "delay_25", default: 1000
    t.integer "delay_26", default: 1000
    t.string "pokemon", default: "Omanyte"
    t.integer "total_tries", default: 0
    t.integer "run_tries", default: 0
    t.integer "omanyte_range_min", default: 215
    t.integer "omanyte_range_max", default: 255
    t.integer "pterodactyl_range_min", default: 215
    t.integer "pterodactyl_range_max", default: 255
    t.integer "kabuto_range_min", default: 215
    t.integer "kabuto_range_max", default: 255
  end

  create_table "hardwares", force: :cascade do |t|
    t.integer "normal_mode_led", default: 8
    t.integer "reset_mode_led", default: 7
    t.integer "shiny_detected_led", default: 3
    t.integer "not_shiny_detected_led", default: 2
    t.integer "a_pin", default: 10
    t.integer "a_led_pin", default: 4
    t.integer "a_standby_angle", default: 95
    t.integer "a_press_angle", default: 103
    t.integer "a_up_angle", default: 20
    t.integer "x_pin", default: 11
    t.integer "x_led_pin", default: 5
    t.integer "x_standby_angle", default: 90
    t.integer "x_press_angle", default: 103
    t.integer "x_up_angle", default: 20
    t.integer "home_pin", default: 9
    t.integer "home_led_pin", default: 6
    t.integer "home_standby_angle", default: 90
    t.integer "home_press_angle", default: 125
    t.integer "home_up_angle", default: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resets", force: :cascade do |t|
    t.integer "home", default: 1000
    t.integer "x", default: 1000
    t.integer "delay_1", default: 1000
    t.integer "delay_2", default: 1000
    t.integer "delay_3", default: 1000
    t.integer "delay_4", default: 1000
    t.integer "delay_5", default: 1000
    t.integer "delay_6", default: 1000
    t.integer "delay_7", default: 1000
    t.integer "delay_8", default: 1000
    t.integer "delay_9", default: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
