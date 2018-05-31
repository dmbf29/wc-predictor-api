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

ActiveRecord::Schema.define(version: 20180523092414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "winner_id"
    t.integer "runner_id"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_groups_on_round_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "kickoff_time"
    t.integer "team_home_score"
    t.integer "team_away_score"
    t.boolean "finished", default: false
    t.boolean "started", default: false
    t.bigint "group_id"
    t.integer "team_home_id"
    t.integer "team_away_id"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_matches_on_group_id"
    t.index ["round_id"], name: "index_matches_on_round_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_memberships_on_league_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "loser_id"
    t.boolean "draw"
    t.boolean "correct"
    t.bigint "match_id"
    t.bigint "round_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_predictions_on_match_id"
    t.index ["round_id"], name: "index_predictions_on_round_id"
    t.index ["user_id"], name: "index_predictions_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.boolean "current", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.string "badge"
    t.integer "points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unions", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_unions_on_group_id"
    t.index ["team_id"], name: "index_unions_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.integer "score", default: 0
    t.boolean "notify", default: false
    t.string "timezone", default: "Europe/Moscow"
    t.integer "score_group"
    t.integer "score_sixteen"
    t.integer "score_quarters"
    t.integer "score_semis"
    t.integer "score_final"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groups", "rounds"
  add_foreign_key "matches", "groups"
  add_foreign_key "matches", "rounds"
  add_foreign_key "memberships", "leagues"
  add_foreign_key "memberships", "users"
  add_foreign_key "predictions", "matches"
  add_foreign_key "predictions", "rounds"
  add_foreign_key "predictions", "users"
  add_foreign_key "unions", "groups"
  add_foreign_key "unions", "teams"
end
