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

ActiveRecord::Schema.define(version: 20170111192729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reward_id"
    t.integer  "amount"
    t.decimal  "shipping"
    t.date     "expiration_date"
    t.string   "uuid"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "postal_code"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["reward_id"], name: "index_pledges_on_reward_id", using: :btree
    t.index ["user_id"], name: "index_pledges_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short_description"
    t.text     "description"
    t.string   "image_url"
    t.string   "status",                                    default: "pending"
    t.decimal  "goal",              precision: 8, scale: 2
    t.datetime "expiration_date"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "slug"
    t.index ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "rewards", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "description"
    t.integer  "value"
    t.decimal  "shipping",           precision: 8, scale: 2
    t.integer  "number_available"
    t.date     "estimated_delivery"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["project_id"], name: "index_rewards_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "customer_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "pledges", "rewards"
  add_foreign_key "pledges", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "rewards", "projects"
end
