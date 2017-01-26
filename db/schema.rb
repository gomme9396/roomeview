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

ActiveRecord::Schema.define(version: 20170125081035) do

  create_table "boards", force: :cascade do |t|
    t.string   "parcel_address"
    t.string   "writer"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "board_id"
    t.string   "writer"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "marker1"
    t.float    "marker2"
    t.string   "writer"
    t.string   "total_address"
    t.string   "parcel_address"
    t.string   "road_address"
    t.string   "detail_address"
    t.string   "comment1"
    t.string   "comment2"
    t.integer  "start_year"
    t.integer  "start_month"
    t.integer  "how_long"
    t.integer  "place_type"
    t.integer  "contract_type"
    t.integer  "price"
    t.integer  "month"
    t.string   "fee"
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
    t.integer  "night"
    t.integer  "light"
    t.integer  "noise"
    t.integer  "sani"
    t.float    "avg1"
    t.float    "avg2"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "confirmation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
