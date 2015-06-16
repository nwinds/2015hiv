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

ActiveRecord::Schema.define(version: 20150616023254) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 65535
    t.integer  "product_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["product_id"], name: "index_comments_on_product_id", using: :btree

  create_table "file_managers", force: :cascade do |t|
    t.string   "file_avatar", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "product_id",  limit: 4
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.integer  "wishlist_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "quantity",    limit: 4, default: 1
    t.integer  "order_id",    limit: 4
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "detail",     limit: 65535
    t.decimal  "price",                    precision: 8, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "avatar",     limit: 255
    t.string   "qr_code",    limit: 255
  end

  create_table "qrcoded_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "hashed_password", limit: 255
    t.string   "salt",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
