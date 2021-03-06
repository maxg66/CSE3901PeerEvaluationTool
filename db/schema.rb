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

ActiveRecord::Schema.define(version: 2020_11_29_201251) do

  create_table "admins", force: :cascade do |t|
    t.string "a_name"
    t.string "a_email"
    t.string "a_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["a_email"], name: "index_admins_on_a_email", unique: true
  end

  create_table "admins_users", id: false, force: :cascade do |t|
    t.integer "admin_id", null: false
    t.integer "user_id", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "student_evaluated"
    t.text "content"
    t.integer "rating"
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_evaluations_on_project_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "g_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups_projects", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "group_id", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "p_name"
    t.string "project_type"
    t.date "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "u_name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "evaluations", "projects"
  add_foreign_key "evaluations", "users"
end