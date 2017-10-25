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

ActiveRecord::Schema.define(version: 20171024124256) do

  create_table "answers", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "answrs", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answrs", ["question_id"], name: "index_answrs_on_question_id"
  add_index "answrs", ["user_id"], name: "index_answrs_on_user_id"

  create_table "follow_questions", force: :cascade do |t|
    t.boolean  "follow"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follow_questions", ["question_id"], name: "index_follow_questions_on_question_id"
  add_index "follow_questions", ["user_id"], name: "index_follow_questions_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
  end

  create_table "upvotes", force: :cascade do |t|
    t.boolean "upvote"
    t.integer "user_id"
    t.integer "answr_id"
  end

  add_index "upvotes", ["answr_id"], name: "index_upvotes_on_answr_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
