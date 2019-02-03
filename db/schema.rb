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

ActiveRecord::Schema.define(version: 2019_02_02_230306) do

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
  end

end
