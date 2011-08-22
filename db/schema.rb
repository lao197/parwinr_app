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

ActiveRecord::Schema.define(:version => 20110822111500) do

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "username"
    t.string   "encryptedPassword"
    t.string   "salt"
    t.string   "accountType"
    t.integer  "points"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["firstName"], :name => "index_users_on_firstName"
  add_index "users", ["lastName"], :name => "index_users_on_lastName"
  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "videos", :force => true do |t|
    t.string   "videoID"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["videoID"], :name => "index_videos_on_videoID"

end
