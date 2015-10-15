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

ActiveRecord::Schema.define(version: 20151015154557) do

  create_table "sale_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value",      precision: 12, scale: 2
    t.integer  "sale_id"
    t.integer  "origin_id"
    t.integer  "quantity"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "sale_items", ["sale_id"], name: "index_sale_items_on_sale_id"

  create_table "sales", force: :cascade do |t|
    t.date     "date"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
