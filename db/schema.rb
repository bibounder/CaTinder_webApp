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

ActiveRecord::Schema.define(version: 20150424083128) do

  create_table "cat_images", force: :cascade do |t|
    t.integer  "cat_id"
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cat_images", ["cat_id"], name: "index_cat_images_on_cat_id"

  create_table "cat_likes", force: :cascade do |t|
    t.integer  "cat_id"
    t.integer  "user_id"
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cat_likes", ["cat_id"], name: "index_cat_likes_on_cat_id"
  add_index "cat_likes", ["user_id"], name: "index_cat_likes_on_user_id"

  create_table "cats", force: :cascade do |t|
    t.integer  "race_id"
    t.string   "name"
    t.boolean  "appart"
    t.integer  "age"
    t.string   "color"
    t.integer  "gender"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cats", ["race_id"], name: "index_cats_on_race_id"

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "token"
    t.integer  "role"
    t.integer  "tw_user"
    t.integer  "fb_user"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

end