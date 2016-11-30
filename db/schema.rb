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

ActiveRecord::Schema.define(version: 20161116144717) do

  create_table "reviews", force: :cascade do |t|
    t.float    "marker1"
    t.float    "marker2"
    t.string   "writer"
    t.string   "total_address"
    t.string   "parcel_address"
    t.string   "road_address"
    t.string   "detail_address"
    t.string   "price"
    t.string   "month"
    t.integer  "start_year"
    t.integer  "start_month"
    t.integer  "how_long"
    t.integer  "fee"
    t.string   "comment1"
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
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
