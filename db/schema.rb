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

ActiveRecord::Schema.define(version: 20201028162229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "department_permissions", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "permission_id"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_department_permissions_on_deleted_at", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_departments_on_deleted_at", using: :btree
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_permissions_on_deleted_at", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_seasons_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "language"
    t.string   "keyboard"
    t.string   "calendar"
    t.string   "default_uom"
    t.string   "region"
    t.string   "organization_unit"
    t.string   "hub"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_preference"
    t.string   "mobile_no"
    t.integer  "number_of_logins"
    t.boolean  "region_user"
    t.boolean  "hub_user"
    t.integer  "user_type_id"
    t.datetime "deleted_at"
    t.boolean  "is_active"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "users_departments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_departments_on_deleted_at", using: :btree
  end

  create_table "users_permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "permission_id"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_permissions_on_deleted_at", using: :btree
  end

  create_table "users_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_roles_on_deleted_at", using: :btree
  end

end
