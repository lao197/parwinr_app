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

ActiveRecord::Schema.define(:version => 20110823105724) do

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "rating",      :precision => 3, :scale => 2, :default => 0.0
    t.integer  "totalRating",                               :default => 0
    t.integer  "noOfRating",                                :default => 0
    t.integer  "likes",                                     :default => 0
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["description"], :name => "index_games_on_description"
  add_index "games", ["title"], :name => "index_games_on_title"
  add_index "games", ["user_id"], :name => "index_games_on_user_id"
  add_index "games", ["video_id"], :name => "index_games_on_video_id"

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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["firstName"], :name => "index_users_on_firstName"
  add_index "users", ["lastName"], :name => "index_users_on_lastName"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "videoID"
    t.string   "videoType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["videoID"], :name => "index_videos_on_videoID", :unique => true
  add_index "videos", ["videoType"], :name => "index_videos_on_videoType"

end
