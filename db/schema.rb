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

ActiveRecord::Schema.define(version: 20160514231838) do

  create_table "clients", force: :cascade do |t|
    t.string "first_name", limit: 10
    t.string "last_name",  limit: 10
    t.string "phone",      limit: 255
  end

  create_table "cultures", force: :cascade do |t|
    t.string "name", limit: 10
  end

  create_table "deeds", force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "elevations", force: :cascade do |t|
    t.integer "deed_id",        limit: 4
    t.integer "flower_id",      limit: 4
    t.date    "elevation_data"
    t.string  "comment",        limit: 200
  end

  add_index "elevations", ["deed_id"], name: "index_elevations_on_deed_id", using: :btree
  add_index "elevations", ["flower_id"], name: "index_elevations_on_flower_id", using: :btree

  create_table "flowers", force: :cascade do |t|
    t.string  "f_name",        limit: 20
    t.integer "culture_id",    limit: 4
    t.integer "cost",          limit: 4
    t.integer "garden_bed_id", limit: 4
    t.date    "planting_date"
  end

  create_table "garden_beds", force: :cascade do |t|
    t.integer "num",     limit: 4
    t.string  "comment", limit: 200
  end

  create_table "orders", force: :cascade do |t|
    t.date    "date"
    t.integer "cost",      limit: 4
    t.integer "flower_id", limit: 4
    t.integer "client_id", limit: 4
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree
  add_index "orders", ["flower_id"], name: "index_orders_on_flower_id", using: :btree

  create_table "results", force: :cascade do |t|
    t.integer "flower_id",   limit: 4
    t.date    "result_date"
    t.string  "comment",     limit: 200
  end

  add_foreign_key "elevations", "deeds"
  add_foreign_key "elevations", "flowers"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "flowers"
end
