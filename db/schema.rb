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

ActiveRecord::Schema.define(version: 20170722210851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.integer  "minute"
    t.string   "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["match_id"], name: "index_cards_on_match_id", using: :btree
  add_index "cards", ["player_id"], name: "index_cards_on_player_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.integer  "minute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  add_index "goals", ["match_id"], name: "index_goals_on_match_id", using: :btree
  add_index "goals", ["player_id"], name: "index_goals_on_player_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["league_id"], name: "index_locations_on_league_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "home_id"
    t.integer  "away_id"
    t.date     "date"
    t.time     "time"
    t.integer  "league_id"
    t.integer  "location_id"
    t.integer  "referee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "matches", ["league_id"], name: "index_matches_on_league_id", using: :btree
  add_index "matches", ["location_id"], name: "index_matches_on_location_id", using: :btree
  add_index "matches", ["referee_id"], name: "index_matches_on_referee_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "team_id"
    t.integer  "age"
    t.decimal  "height",     precision: 5, scale: 2
    t.decimal  "weight",     precision: 5, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "cups",                               default: 0, null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "referees", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "referees", ["league_id"], name: "index_referees_on_league_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  add_foreign_key "cards", "matches"
  add_foreign_key "cards", "players"
  add_foreign_key "goals", "matches"
  add_foreign_key "goals", "players"
  add_foreign_key "locations", "leagues"
  add_foreign_key "matches", "leagues"
  add_foreign_key "matches", "locations"
  add_foreign_key "matches", "referees"
  add_foreign_key "players", "teams"
  add_foreign_key "referees", "leagues"
  add_foreign_key "teams", "leagues"
end
