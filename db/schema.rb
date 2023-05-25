# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_05_25_011738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_instances", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "winner_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_instances_on_game_id"
    t.index ["winner_id"], name: "index_game_instances_on_winner_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "topic", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_instance_id", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_instance_id"], name: "index_player_sessions_on_game_instance_id"
    t.index ["user_id"], name: "index_player_sessions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question", null: false
    t.string "options", default: [], null: false, array: true
    t.string "answer", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_questions_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_instances", "games"
  add_foreign_key "player_sessions", "game_instances"
  add_foreign_key "player_sessions", "users"
end
