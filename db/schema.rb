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

ActiveRecord::Schema.define(version: 20171201081142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_chat_rooms_on_group_id"
  end

  create_table "courses", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.float "percentage"
    t.text "lettergrade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_description"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.string "school"
    t.string "faculty"
  end

  add_foreign_key "chat_rooms", "groups"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
end
