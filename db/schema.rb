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

ActiveRecord::Schema.define(version: 20150331234256) do

  create_table "capitals", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.date     "date"
    t.decimal  "amount",                 precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "capitals_transactions", id: false, force: :cascade do |t|
    t.integer "capitals_id",     limit: 4
    t.integer "transactions_id", limit: 4
  end

  add_index "capitals_transactions", ["capitals_id"], name: "index_capitals_transactions_on_capitals_id", using: :btree
  add_index "capitals_transactions", ["transactions_id"], name: "index_capitals_transactions_on_transactions_id", using: :btree

  create_table "fund_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "mutual_funds", force: :cascade do |t|
    t.integer  "fund_type_id", limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "mutual_funds", ["fund_type_id"], name: "index_mutual_funds_on_fund_type_id", using: :btree

  create_table "share_packages", force: :cascade do |t|
    t.integer  "mutual_fund_id", limit: 4
    t.date     "fact_date"
    t.decimal  "price",                    precision: 10
    t.decimal  "units",                    precision: 10
    t.decimal  "market_value",             precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "share_packages", ["mutual_fund_id"], name: "index_share_packages_on_mutual_fund_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "type",        limit: 255
    t.date     "date"
    t.text     "description", limit: 65535
    t.decimal  "price",                     precision: 10
    t.decimal  "units",                     precision: 10
    t.decimal  "amount",                    precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "transactions_share_packages", id: false, force: :cascade do |t|
    t.integer "share_packages_id", limit: 4
    t.integer "transactions_id",   limit: 4
  end

  add_index "transactions_share_packages", ["share_packages_id"], name: "index_transactions_share_packages_on_share_packages_id", using: :btree
  add_index "transactions_share_packages", ["transactions_id"], name: "index_transactions_share_packages_on_transactions_id", using: :btree

end
