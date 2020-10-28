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

ActiveRecord::Schema.define(version: 2020_10_28_071315) do

  create_table "astrophotographers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "profile_image"
    t.string "bio"
  end

  create_table "constellations", force: :cascade do |t|
    t.string "constellation_name"
    t.string "star_name"
    t.string "description"
    t.float "light_years_away_from_earth"
    t.string "image_url"
    t.string "profile_image"
    t.string "bio"
  end

  create_table "stargazings", force: :cascade do |t|
    t.integer "astrophotographer_id"
    t.integer "constellation_id"
    t.string "location"
    t.integer "weather"
    t.string "time"
  end

end
