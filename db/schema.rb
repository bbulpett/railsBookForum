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

ActiveRecord::Schema.define(version: 20160112225959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "thredded_categories", force: :cascade do |t|
    t.integer  "messageboard_id", null: false
    t.string   "name",            null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",            null: false
    t.index ["messageboard_id", "slug"], name: "index_thredded_categories_on_messageboard_id_and_slug", unique: true, using: :btree
    t.index ["messageboard_id"], name: "index_thredded_categories_on_messageboard_id", using: :btree
  end

  create_table "thredded_images", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "width"
    t.integer  "height"
    t.string   "orientation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["post_id"], name: "index_thredded_images_on_post_id", using: :btree
  end

  create_table "thredded_messageboards", force: :cascade do |t|
    t.string   "name",                                       null: false
    t.string   "slug"
    t.text     "description"
    t.string   "security",             default: "public"
    t.string   "posting_permission",   default: "anonymous"
    t.integer  "topics_count",         default: 0
    t.integer  "posts_count",          default: 0
    t.boolean  "closed",               default: false,       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filter",               default: "markdown",  null: false
    t.integer  "private_topics_count", default: 0
    t.index ["closed"], name: "index_thredded_messageboards_on_closed", using: :btree
    t.index ["slug"], name: "index_thredded_messageboards_on_slug", using: :btree
  end

  create_table "thredded_notification_preferences", force: :cascade do |t|
    t.boolean  "notify_on_mention", default: true
    t.boolean  "notify_on_message", default: true
    t.integer  "user_id",                          null: false
    t.integer  "messageboard_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["messageboard_id"], name: "index_thredded_notification_preferences_on_messageboard_id", using: :btree
    t.index ["user_id"], name: "index_thredded_notification_preferences_on_user_id", using: :btree
  end

  create_table "thredded_post_notifications", force: :cascade do |t|
    t.string   "email",      null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["post_id"], name: "index_thredded_post_notifications_on_post_id", using: :btree
  end

  create_table "thredded_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "ip"
    t.string   "filter",          default: "markdown"
    t.string   "source",          default: "web"
    t.integer  "postable_id"
    t.integer  "messageboard_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postable_type"
    t.index ["messageboard_id"], name: "index_thredded_posts_on_messageboard_id", using: :btree
    t.index ["postable_id", "postable_type"], name: "index_thredded_posts_on_postable_id_and_postable_type", using: :btree
    t.index ["postable_id"], name: "index_thredded_posts_on_postable_id", using: :btree
    t.index ["user_id"], name: "index_thredded_posts_on_user_id", using: :btree
  end

  create_table "thredded_private_topics", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "last_user_id",                null: false
    t.string   "title",                       null: false
    t.string   "slug",                        null: false
    t.integer  "messageboard_id",             null: false
    t.integer  "posts_count",     default: 0
    t.string   "hash_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["hash_id"], name: "index_thredded_private_topics_on_hash_id", using: :btree
    t.index ["messageboard_id"], name: "index_thredded_private_topics_on_messageboard_id", using: :btree
    t.index ["slug"], name: "index_thredded_private_topics_on_slug", using: :btree
  end

  create_table "thredded_private_users", force: :cascade do |t|
    t.integer  "private_topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",             default: false
    t.index ["private_topic_id"], name: "index_thredded_private_users_on_private_topic_id", using: :btree
    t.index ["read"], name: "index_thredded_private_users_on_read", using: :btree
    t.index ["user_id"], name: "index_thredded_private_users_on_user_id", using: :btree
  end

  create_table "thredded_roles", force: :cascade do |t|
    t.string   "level"
    t.integer  "user_id"
    t.integer  "messageboard_id"
    t.datetime "last_seen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["messageboard_id"], name: "index_thredded_roles_on_messageboard_id", using: :btree
    t.index ["user_id"], name: "index_thredded_roles_on_user_id", using: :btree
  end

  create_table "thredded_topic_categories", force: :cascade do |t|
    t.integer "topic_id",    null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_thredded_topic_categories_on_category_id", using: :btree
    t.index ["topic_id"], name: "index_thredded_topic_categories_on_topic_id", using: :btree
  end

  create_table "thredded_topics", force: :cascade do |t|
    t.integer  "user_id",                         null: false
    t.integer  "last_user_id",                    null: false
    t.string   "title",                           null: false
    t.string   "slug",                            null: false
    t.integer  "messageboard_id",                 null: false
    t.integer  "posts_count",     default: 0,     null: false
    t.boolean  "sticky",          default: false, null: false
    t.boolean  "locked",          default: false, null: false
    t.string   "hash_id",                         null: false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["hash_id"], name: "index_thredded_topics_on_hash_id", using: :btree
    t.index ["last_user_id"], name: "index_thredded_topics_on_last_user_id", using: :btree
    t.index ["messageboard_id", "slug"], name: "index_thredded_topics_on_messageboard_id_and_slug", unique: true, using: :btree
    t.index ["messageboard_id"], name: "index_thredded_topics_on_messageboard_id", using: :btree
    t.index ["user_id"], name: "index_thredded_topics_on_user_id", using: :btree
  end

  create_table "thredded_user_details", force: :cascade do |t|
    t.integer  "user_id",                            null: false
    t.datetime "latest_activity_at"
    t.integer  "posts_count",        default: 0
    t.integer  "topics_count",       default: 0
    t.boolean  "superadmin",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["latest_activity_at"], name: "index_thredded_user_details_on_latest_activity_at", using: :btree
    t.index ["user_id"], name: "index_thredded_user_details_on_user_id", using: :btree
  end

  create_table "thredded_user_preferences", force: :cascade do |t|
    t.integer  "user_id",                                           null: false
    t.string   "time_zone",  default: "Eastern Time (US & Canada)"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_thredded_user_preferences_on_user_id", using: :btree
  end

  create_table "thredded_user_topic_reads", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "topic_id",                null: false
    t.integer  "post_id",                 null: false
    t.integer  "posts_count", default: 0, null: false
    t.integer  "page",        default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["page"], name: "index_thredded_user_topic_reads_on_page", using: :btree
    t.index ["post_id"], name: "index_thredded_user_topic_reads_on_post_id", using: :btree
    t.index ["posts_count"], name: "index_thredded_user_topic_reads_on_posts_count", using: :btree
    t.index ["topic_id"], name: "index_thredded_user_topic_reads_on_topic_id", using: :btree
    t.index ["user_id", "topic_id"], name: "index_thredded_user_topic_reads_on_user_id_and_topic_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_thredded_user_topic_reads_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "admin",                      default: false, null: false
    t.string   "name",            limit: 20,                 null: false
  end

end
