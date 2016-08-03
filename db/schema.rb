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

ActiveRecord::Schema.define(version: 20160705054920) do

  create_table "addresses", force: :cascade do |t|
    t.float    "marker1"
    t.float    "marker2"
    t.string   "current_user"
    t.string   "address"
    t.string   "detail_address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "addressreviews", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "address_name"
    t.string   "price"
    t.string   "month"
    t.string   "start_date"
    t.string   "end_date"
    t.integer  "fee"
    t.string   "comment1"
    t.string   "image_url1",   default: ""
    t.string   "image_url2",   default: ""
    t.string   "image_url3",   default: ""
    t.string   "image_url4",   default: ""
    t.integer  "cool"
    t.integer  "warm"
    t.integer  "sun"
    t.integer  "blocking"
    t.integer  "wind"
    t.integer  "bug"
    t.integer  "iron"
    t.integer  "smell"
    t.integer  "pet"
    t.integer  "gas"
    t.integer  "micro"
    t.integer  "bed"
    t.integer  "desk"
    t.integer  "laundry"
    t.integer  "internet"
    t.integer  "fire"
    t.integer  "cctv"
    t.integer  "parking"
    t.string   "comment2"
    t.integer  "night"
    t.integer  "light"
    t.integer  "noise"
    t.integer  "sani"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "comment"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
