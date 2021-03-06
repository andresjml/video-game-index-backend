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

ActiveRecord::Schema.define(version: 2021_08_10_152411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_platforms", force: :cascade do |t|
    t.integer "game_id"
    t.integer "platform_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "genre_id"
    t.index ["genre_id"], name: "index_games_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
  end

end
