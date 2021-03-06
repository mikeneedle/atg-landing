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

ActiveRecord::Schema.define(version: 20180128180732) do

  create_table "activities", force: :cascade do |t|
    t.string "description"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "description"
  end

  create_table "flexibles", force: :cascade do |t|
    t.string "description"
  end

  create_table "locations", force: :cascade do |t|
    t.string "description"
  end

  create_table "new_trip_activities", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "activity_id"
  end

  create_table "trip_activities", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "activity_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "booked"
    t.integer "location_id"
    t.date "start_date"
    t.date "end_date"
    t.integer "experience_id"
    t.integer "flexible_id"
    t.integer "group_size"
  end

end
