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

ActiveRecord::Schema.define(:version => 20110825084012) do

  create_table "gameposts", :force => true do |t|
    t.text     "text"
    t.integer  "likes",      :default => 0
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gameposts", ["game_id"], :name => "index_gameposts_on_game_id"
  add_index "gameposts", ["user_id"], :name => "index_gameposts_on_user_id"

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

  create_table "post_likes", :force => true do |t|
    t.integer "user_id"
    t.integer "gamepost_id"
  end

  add_index "post_likes", ["gamepost_id"], :name => "index_post_likes_on_gamepost_id"
  add_index "post_likes", ["user_id", "gamepost_id"], :name => "index_post_likes_on_user_id_and_gamepost_id", :unique => true

  create_table "segment_tasks", :force => true do |t|
    t.integer "segment_id"
    t.integer "task_id"
  end

  add_index "segment_tasks", ["segment_id", "task_id"], :name => "index_segment_tasks_on_segment_id_and_task_id", :unique => true
  add_index "segment_tasks", ["segment_id"], :name => "index_segment_tasks_on_segment_id"
  add_index "segment_tasks", ["task_id"], :name => "index_segment_tasks_on_task_id"

  create_table "segments", :force => true do |t|
    t.integer "startTime"
    t.integer "endTime"
    t.integer "game_id"
  end

  add_index "segments", ["game_id"], :name => "index_segments_on_game_id"

  create_table "tasks", :force => true do |t|
    t.string   "taskType"
    t.text     "xmlContent"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

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
    t.integer  "user_id"
  end

  add_index "videos", ["user_id"], :name => "index_videos_on_user_id"
  add_index "videos", ["videoID"], :name => "index_videos_on_videoID", :unique => true
  add_index "videos", ["videoType"], :name => "index_videos_on_videoType"

end
