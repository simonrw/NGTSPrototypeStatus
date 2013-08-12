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

ActiveRecord::Schema.define(version: 20130812221333) do

  create_table "measurements", force: true do |t|
    t.float    "mjd"
    t.float    "sky_background"
    t.float    "humidity"
    t.float    "ambient_temp"
    t.float    "ccd_temp"
    t.float    "fwhm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "observation_id"
    t.float    "airmass"
    t.float    "tel_ra"
    t.float    "tel_dec"
    t.float    "exposure_time"
    t.float    "moon_distance"
    t.float    "sun_distance"
  end

  add_index "measurements", ["observation_id"], name: "index_measurements_on_observation_id"

  create_table "nights", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observations", force: true do |t|
    t.integer  "observation_number"
    t.integer  "night_id"
    t.text     "log"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observations", ["night_id"], name: "index_observations_on_night_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
