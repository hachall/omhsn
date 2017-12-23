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

ActiveRecord::Schema.define(version: 20171222184127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.text "description"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "photo"
  end

  create_table "resources", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.string "website"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.text "what_they_do"
    t.text "about"
    t.text "tip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "taglines", default: [], array: true
    t.string "taglines_as_string"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.string "contacts", default: [], array: true
    t.string "contacts_as_string"
    t.string "category"
  end

  create_table "saved_events", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_saved_events_on_event_id"
    t.index ["user_id"], name: "index_saved_events_on_user_id"
  end

  create_table "saved_resources", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_saved_resources_on_resource_id"
    t.index ["user_id"], name: "index_saved_resources_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "saved_events", "events"
  add_foreign_key "saved_events", "users"
  add_foreign_key "saved_resources", "resources"
  add_foreign_key "saved_resources", "users"
end
