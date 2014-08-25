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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140816235033) do

  create_table "challenges", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.date     "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "total_burpees",   :default => 0
    t.integer  "total_time",      :default => 0
    t.integer  "num_workouts",    :default => 0
    t.integer  "best_workout_id"
    t.integer  "challenge_id"
    t.boolean  "notifications",   :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "workouts", :force => true do |t|
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer  "duration"
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.integer  "num_burpees",  :default => 100
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
