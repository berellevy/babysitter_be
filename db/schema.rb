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

ActiveRecord::Schema.define(version: 2020_11_03_211451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "sitter_id", null: false
    t.time "start"
    t.time "end"
    t.integer "weekday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "name"
    t.datetime "birthday"
    t.integer "years_of_experience"
    t.text "bio"
    t.string "contact_name"
    t.string "contact_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "availabilities", "sitters"
  add_foreign_key "references", "sitters"
end
