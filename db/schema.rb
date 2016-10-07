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

ActiveRecord::Schema.define(version: 20161007123909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "answer_variants", force: :cascade do |t|
    t.string   "answer_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.boolean  "truthy"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "first_player_id"
    t.integer  "second_player_id"
    t.string   "state",             null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "winner_id"
    t.integer  "current_player_id"
    t.integer  "current_round_id"
  end

  add_index "games", ["current_player_id"], name: "index_games_on_current_player_id", using: :btree
  add_index "games", ["current_round_id"], name: "index_games_on_current_round_id", using: :btree

  create_table "player_answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "answer_variant_id"
    t.boolean "truthy"
    t.integer "game_id"
  end

  add_index "player_answers", ["answer_variant_id"], name: "index_player_answers_on_answer_variant_id", using: :btree
  add_index "player_answers", ["game_id"], name: "index_player_answers_on_game_id", using: :btree
  add_index "player_answers", ["question_id"], name: "index_player_answers_on_question_id", using: :btree
  add_index "player_answers", ["user_id"], name: "index_player_answers_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question_text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "category_id"
  end

  add_index "questions", ["category_id"], name: "index_questions_on_category_id", using: :btree

  create_table "round_questions", force: :cascade do |t|
    t.integer  "round_id"
    t.integer  "question_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "first_player_answer_id"
    t.integer  "second_player_answer_id"
  end

  add_index "round_questions", ["question_id"], name: "index_round_questions_on_question_id", using: :btree
  add_index "round_questions", ["round_id"], name: "index_round_questions_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "rounds", ["category_id"], name: "index_rounds_on_category_id", using: :btree
  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.string   "role",                   default: "user"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "games", "rounds", column: "current_round_id"
  add_foreign_key "games", "users", column: "current_player_id"
  add_foreign_key "games", "users", column: "first_player_id"
  add_foreign_key "games", "users", column: "second_player_id"
  add_foreign_key "games", "users", column: "winner_id"
  add_foreign_key "player_answers", "answer_variants"
  add_foreign_key "player_answers", "games"
  add_foreign_key "player_answers", "questions"
  add_foreign_key "player_answers", "users"
  add_foreign_key "questions", "categories"
  add_foreign_key "round_questions", "answer_variants", column: "first_player_answer_id"
  add_foreign_key "round_questions", "answer_variants", column: "second_player_answer_id"
  add_foreign_key "rounds", "categories"
end
