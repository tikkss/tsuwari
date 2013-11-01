# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131029053619) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eatings", force: true do |t|
    t.integer  "health_record_id"
    t.integer  "food_id"
    t.integer  "amount",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eatings", ["food_id"], name: "index_eatings_on_food_id"
  add_index "eatings", ["health_record_id", "food_id"], name: "index_eatings_on_health_record_id_and_food_id", unique: true
  add_index "eatings", ["health_record_id"], name: "index_eatings_on_health_record_id"

  create_table "food_tastes", force: true do |t|
    t.integer  "food_id"
    t.integer  "taste_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "food_tastes", ["food_id"], name: "index_food_tastes_on_food_id"
  add_index "food_tastes", ["taste_id"], name: "index_food_tastes_on_taste_id"

  create_table "foods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "health_records", force: true do |t|
    t.date     "date"
    t.integer  "time_period"
    t.integer  "health"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servings", force: true do |t|
    t.integer  "shop_id"
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "servings", ["shop_id", "food_id"], name: "index_servings_on_shop_id_and_food_id", unique: true
  add_index "servings", ["shop_id"], name: "index_servings_on_shop_id"

  create_table "shops", force: true do |t|
    t.string   "name"
    t.string   "prefecture"
    t.string   "city"
    t.string   "address"
    t.string   "url"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "tastes", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tastes", ["name"], name: "index_tastes_on_name", unique: true

end
