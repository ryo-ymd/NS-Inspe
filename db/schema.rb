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

ActiveRecord::Schema.define(version: 20170125190648) do

  create_table "options", force: :cascade do |t|
    t.string   "option_name",                     null: false
    t.boolean  "standard_option", default: false
    t.string   "count",           default: "1",   null: false
    t.integer  "charge",          default: 0,     null: false
    t.string   "remark"
    t.integer  "space_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "reservation_options", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "option_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_id"], name: "index_reservation_options_on_option_id"
    t.index ["reservation_id"], name: "index_reservation_options_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "start_time_block", null: false
    t.integer  "end_time_block",   null: false
    t.string   "block_modify"
    t.integer  "space_id"
    t.date     "date",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "space_pictures", force: :cascade do |t|
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "address",                            null: false
    t.string   "mail_address"
    t.string   "tel"
    t.integer  "member_limit",                       null: false
    t.integer  "charge",                             null: false
    t.integer  "min_time_block",      default: 0
    t.integer  "max_time_block",      default: 0
    t.integer  "start_time_block",    default: 0
    t.integer  "finish_time_block",   default: 0
    t.string   "description"
    t.integer  "cancellation_charge", default: 0
    t.integer  "space_type",                         null: false
    t.boolean  "visible",             default: true, null: false
    t.boolean  "authorized",          default: true, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "mail",                            null: false
    t.string   "name",                            null: false
    t.integer  "member_type",                     null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
