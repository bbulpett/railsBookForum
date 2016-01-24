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

ActiveRecord::Schema.define(version: 20160124203656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forums", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "forum_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_posts_on_forum_id", using: :btree
    t.index ["topic_id"], name: "index_posts_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",          limit: 150,              null: false
    t.integer  "last_poster_id",                          null: false
    t.datetime "last_post_at"
    t.text     "tags",                       default: [],              array: true
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["forum_id"], name: "index_topics_on_forum_id", using: :btree
    t.index ["last_poster_id"], name: "index_topics_on_last_poster_id", using: :btree
    t.index ["title"], name: "index_topics_on_title", using: :btree
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username",        limit: 20,                 null: false
    t.boolean  "admin",                      default: false, null: false
    t.string   "password_digest"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  add_foreign_key "posts", "forums"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "topics", "forums"
  add_foreign_key "topics", "users"
end
