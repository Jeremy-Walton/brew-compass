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

ActiveRecord::Schema[8.0].define(version: 2025_03_22_172836) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "beans", force: :cascade do |t|
    t.string "name"
    t.string "roaster"
    t.datetime "roast_date"
    t.string "taste_profile"
    t.boolean "decaf"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_beans_on_user_id"
  end

  create_table "brewing_methods", force: :cascade do |t|
    t.string "name", null: false
    t.string "prep_type", default: "pourover", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_brewing_methods_on_user_id"
  end

  create_table "brews", force: :cascade do |t|
    t.bigint "brewing_method_id", null: false
    t.bigint "bean_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["bean_id"], name: "index_brews_on_bean_id"
    t.index ["brewing_method_id"], name: "index_brews_on_brewing_method_id"
    t.index ["user_id"], name: "index_brews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user", null: false
    t.boolean "super_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beans", "users"
  add_foreign_key "brewing_methods", "users"
  add_foreign_key "brews", "beans"
  add_foreign_key "brews", "brewing_methods"
  add_foreign_key "brews", "users"
end
