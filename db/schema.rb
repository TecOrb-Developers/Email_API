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

ActiveRecord::Schema.define(version: 20160524150119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activemails", force: :cascade do |t|
    t.integer  "defaultemail_id"
    t.integer  "admin_user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "status"
  end

  add_index "activemails", ["admin_user_id"], name: "index_activemails_on_admin_user_id", using: :btree
  add_index "activemails", ["defaultemail_id"], name: "index_activemails_on_defaultemail_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "default_emails", force: :cascade do |t|
    t.string   "email"
    t.string   "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defaultemails", force: :cascade do |t|
    t.string   "email"
    t.string   "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_records", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_sends", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "send_emails", force: :cascade do |t|
    t.string   "email"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "send_by"
  end

  add_foreign_key "activemails", "admin_users"
  add_foreign_key "activemails", "defaultemails"
end
