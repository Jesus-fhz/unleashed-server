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

ActiveRecord::Schema.define(version: 2022_02_19_064259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pets", force: :cascade do |t|
    t.integer "user_id"
    t.string "image"
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.boolean "is_male"
    t.string "size"
    t.boolean "desexed"
    t.boolean "can_walk_offleash"
    t.boolean "can_be_petted"
    t.boolean "can_walk_with_other_dogs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "user_type", default: 0
    t.string "address"
    t.boolean "is_available"
    t.float "earnings"
    t.float "geocode_lat"
    t.float "geocode_lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "email"
    t.text "password_digest"
    t.string "profile_image"
  end

  create_table "walks", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "user_id"
    t.integer "status", default: 0
    t.float "cost"
    t.float "duration"
    t.float "geocode_lat"
    t.float "geocode_lng"
    t.text "special_instruction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
