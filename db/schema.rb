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

ActiveRecord::Schema.define(version: 20141219193625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "content",        limit: 500
    t.string   "commenter_name", limit: 40
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "post_id"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.boolean  "header_photo",            default: false
    t.boolean  "cover_photo",             default: false
  end

  add_index "photos", ["post_id", "header_photo"], name: "unique_header_photo", unique: true, where: "(header_photo IS TRUE)", using: :btree

  create_table "posts", force: true do |t|
    t.text     "content"
    t.string   "title",      limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "name",               limit: 50
    t.string "email",              limit: 50
    t.string "salt"
    t.string "encrypted_password"
  end

end
