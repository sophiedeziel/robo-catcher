# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_11_205011) do

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
    t.integer "delay_12", default: 1000
    t.integer "grimer_range_min"
    t.integer "grimer_range_max"
    t.integer "sandshrew_range_min"
    t.integer "sandshrew_range_max"
    t.integer "raichu_range_min"
    t.integer "raichu_range_max"
    t.integer "vulpix_range_min"
    t.integer "vulpix_range_max"
    t.integer "diglett_range_min"
    t.integer "diglett_range_max"
    t.integer "geodude_range_min"
    t.integer "geodude_range_max"
    t.integer "exeggutor_range_min"
    t.integer "exeggutor_range_max"
    t.integer "marowak_range_min"
    t.integer "marowak_range_max"
    t.integer "meowth_range_min"
    t.integer "meowth_range_max"
  end

  create_table "attempts", force: :cascade do |t|
    t.string "pokemon"
    t.string "image"
    t.integer "detected_hue"
    t.integer "hue_min"
    t.integer "hue_max"
    t.boolean "is_shiny"
    t.boolean "is_false_positive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.integer "up_pin", default: 13
    t.integer "up_standby_angle", default: 90
    t.integer "up_press_angle", default: 100
    t.integer "up_up_angle", default: 20
    t.integer "right_pin", default: 12
    t.integer "right_standby_angle", default: 90
    t.integer "right_press_angle", default: 100
    t.integer "right_up_angle", default: 20
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

  create_table "settings", force: :cascade do |t|
    t.string "numero"
    t.string "twilio_sid"
    t.string "twilio_token"
    t.string "cloudinary_key"
    t.string "cloudinary_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twitter_consumer_key"
    t.string "twitter_consumer_secret"
    t.string "twitter_access_token"
    t.string "twitter_token_secret"
    t.boolean "twitter_enabled", default: false
    t.string "cloudinary_cloud", default: "duj3xcocx"
  end

  create_table "starters", force: :cascade do |t|
    t.integer "run_tries", default: 0
    t.integer "total_tries", default: 0
    t.integer "chimchar_range_min"
    t.integer "chimchar_range_max"
    t.integer "turtwig_range_min"
    t.integer "turtwig_range_max"
    t.integer "piplup_range_min", default: 202
    t.integer "piplup_range_max", default: 220
    t.integer "delay_1", default: 2000
    t.integer "delay_2", default: 4000
    t.integer "delay_3", default: 2000
    t.integer "delay_4", default: 1000
    t.integer "delay_5", default: 1000
    t.integer "delay_6", default: 1000
    t.integer "delay_7", default: 1000
    t.integer "delay_8", default: 2000
    t.integer "delay_9", default: 1000
    t.integer "delay_10", default: 1000
    t.integer "delay_11", default: 1000
    t.integer "delay_12", default: 1000
    t.integer "delay_13", default: 5000
    t.integer "delay_14", default: 4000
    t.integer "delay_15", default: 5000
    t.integer "delay_16", default: 3500
    t.integer "delay_17", default: 1000
    t.integer "delay_18", default: 1000
    t.integer "delay_19", default: 1000
    t.integer "delay_20", default: 5500
    t.integer "delay_21", default: 1000
    t.integer "delay_22", default: 1000
    t.integer "delay_23", default: 5000
    t.integer "delay_24", default: 1000
    t.integer "delay_25", default: 6000
    t.integer "delay_26", default: 2000
    t.integer "delay_27", default: 1000
    t.integer "delay_28", default: 1000
    t.integer "delay_29", default: 1000
    t.integer "delay_30", default: 1000
    t.integer "delay_31", default: 18000
    t.integer "piplup_total"
    t.integer "turtwig_total"
    t.integer "chimchar_total"
    t.string "pokemon", default: "Piplup"
  end

  create_table "tweet_templates", force: :cascade do |t|
    t.string "event"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
