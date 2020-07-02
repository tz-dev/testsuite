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

ActiveRecord::Schema.define(version: 20200702214654) do

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "shuffle_answers"
    t.boolean "shuffle_questions"
    t.integer "questions"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image"
    t.integer "exam"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "exam"
    t.string "q_type"
    t.text "q_text"
    t.string "q_answer001"
    t.boolean "q_answer001_active"
    t.boolean "q_answer001_correct"
    t.string "q_answer002"
    t.boolean "q_answer002_active"
    t.boolean "q_answer002_correct"
    t.string "q_answer003"
    t.boolean "q_answer003_active"
    t.boolean "q_answer003_correct"
    t.string "q_answer004"
    t.boolean "q_answer004_active"
    t.boolean "q_answer004_correct"
    t.string "q_answer005"
    t.boolean "q_answer005_active"
    t.boolean "q_answer005_correct"
    t.string "q_answer006"
    t.boolean "q_answer006_active"
    t.boolean "q_answer006_correct"
    t.string "q_answer007"
    t.boolean "q_answer007_active"
    t.boolean "q_answer007_correct"
    t.string "q_answer008"
    t.boolean "q_answer008_active"
    t.boolean "q_answer008_correct"
    t.string "q_answer009"
    t.boolean "q_answer009_active"
    t.boolean "q_answer009_correct"
    t.string "q_answer010"
    t.boolean "q_answer010_active"
    t.boolean "q_answer010_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
