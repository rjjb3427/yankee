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

ActiveRecord::Schema.define(version: 20121226130949) do

  create_table "faq_categories", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faq_contents", force: true do |t|
    t.boolean "html",    default: false, null: false
    t.string  "content"
  end

  create_table "faqs", force: true do |t|
    t.integer  "faq_category_id",             null: false
    t.string   "title",                       null: false
    t.integer  "count",           default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faqs", ["faq_category_id"], name: "index_faqs_on_faq_category_id"

  create_table "galleries", force: true do |t|
    t.integer  "gallery_category_id", null: false
    t.string   "title",               null: false
    t.string   "photo",               null: false
    t.text     "content",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["gallery_category_id"], name: "index_galleries_on_gallery_category_id"

  create_table "gallery_categories", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goodbyes", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_book_comments", force: true do |t|
    t.integer  "guest_book_id", null: false
    t.string   "name",          null: false
    t.string   "password",      null: false
    t.text     "content",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guest_book_comments", ["guest_book_id"], name: "index_guest_book_comments_on_guest_book_id"

  create_table "guest_book_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "guest_books", force: true do |t|
    t.string   "title",      limit: 60,             null: false
    t.string   "name",       limit: 60,             null: false
    t.string   "password",   limit: 40,             null: false
    t.integer  "comment",               default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "notice_contents", force: true do |t|
    t.boolean "html",    default: false, null: false
    t.text    "content",                 null: false
  end

  create_table "notices", force: true do |t|
    t.integer  "user_id",               null: false
    t.string   "title",      limit: 60, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id"

  create_table "question_comments", force: true do |t|
    t.integer  "question_id", null: false
    t.string   "name",        null: false
    t.string   "password",    null: false
    t.text     "content",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_comments", ["question_id"], name: "index_question_comments_on_question_id"

  create_table "question_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "questions", force: true do |t|
    t.string   "title",      limit: 60,             null: false
    t.string   "name",       limit: 60,             null: false
    t.string   "password",   limit: 40,             null: false
    t.integer  "comment",               default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              null: false
    t.string   "name",                               null: false
    t.string   "description",                        null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "admin",                  default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
