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

ActiveRecord::Schema.define(version: 2020_12_05_170709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conductors", force: :cascade do |t|
    t.string "name"
    t.boolean "current_conductor"
    t.integer "orchestra_id"
    t.integer "years_in_residence"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.integer "section_id"
    t.datetime "date_hired"
    t.integer "age"

    t.timestamps
  end

  create_table "orchestras", force: :cascade do |t|
    t.string "name"
    t.datetime "date_established"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_date"
    t.boolean "cartage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
