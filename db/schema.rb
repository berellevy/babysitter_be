# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_150152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "sitter_id", null: false
    t.datetime "start_time", null: false
    t.string "title"
    t.text "note"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration_minutes", default: 60, null: false
    t.index ["sitter_id"], name: "index_appointments_on_sitter_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "sitter_id", null: false
    t.time "start_time", null: false
    t.integer "weekday", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration_minutes", default: 60, null: false
    t.index ["sitter_id"], name: "index_availabilities_on_sitter_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "relationship"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sitter_id", null: false
    t.index ["sitter_id"], name: "index_references_on_sitter_id"
  end

  create_table "sitters", force: :cascade do |t|
    t.string "first_name"
    t.datetime "birthday"
    t.integer "years_of_experience"
    t.text "bio"
    t.string "contact_name"
    t.string "contact_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.string "contact_relation"
    t.string "last_name", null: false
    t.boolean "available", default: true, null: false
    t.string "google_token"
    t.string "google_refresh_token"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.string "first_name"
    t.datetime "birthday"
    t.integer "years_of_experience"
    t.text "bio"
    t.string "contact_name"
    t.string "contact_phone"
    t.float "price"
    t.string "contact_relation"
    t.string "last_name"
    t.boolean "available", default: true, null: false
    t.string "google_token"
    t.string "google_refresh_token"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "access_token"
    t.datetime "access_token_date"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "appointments", "sitters"
  add_foreign_key "availabilities", "sitters"
  add_foreign_key "references", "sitters"
end
