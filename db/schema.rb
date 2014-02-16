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

ActiveRecord::Schema.define(version: 20131202102154) do

  create_table "ad_positions", force: true do |t|
    t.string   "title",      limit: 60,                null: false
    t.string   "position",   limit: 20,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_positions", ["position"], name: "index_ad_positions_on_position", unique: true
  add_index "ad_positions", ["title"], name: "index_ad_positions_on_title", unique: true

  create_table "blog_categories", force: true do |t|
    t.integer  "blog_type_id",                           null: false
    t.string   "title",        limit: 60,                null: false
    t.integer  "blogs_count",             default: 0,    null: false
    t.boolean  "enable",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_categories", ["blog_type_id"], name: "index_blog_categories_on_blog_type_id"

  create_table "blog_category_rels", force: true do |t|
    t.integer  "blog_category_id",     null: false
    t.integer  "blog_category_rel_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_category_rels", ["blog_category_id"], name: "index_blog_category_rels_on_blog_category_id"
  add_index "blog_category_rels", ["blog_category_rel_id"], name: "index_blog_category_rels_on_blog_category_rel_id"

  create_table "blog_comments", force: true do |t|
    t.integer  "blog_id",                       null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "encrypted_password", limit: 40
    t.string   "salt"
    t.text     "content",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_comments", ["blog_id"], name: "index_blog_comments_on_blog_id"
  add_index "blog_comments", ["user_id"], name: "index_blog_comments_on_user_id"

  create_table "blog_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "blog_types", force: true do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", force: true do |t|
    t.integer  "user_id",                                    null: false
    t.integer  "blog_category_id",                           null: false
    t.string   "title",            limit: 60,                null: false
    t.text     "description",                                null: false
    t.string   "photo"
    t.boolean  "enable",                      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["blog_category_id"], name: "index_blogs_on_blog_category_id"
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "contact_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "contacts", force: true do |t|
    t.string   "name",       limit: 60
    t.string   "email"
    t.string   "phone",      limit: 40
    t.string   "title",      limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faq_categories", force: true do |t|
    t.string   "title",                     null: false
    t.boolean  "enable",     default: true, null: false
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
    t.integer  "gallery_category_id",                null: false
    t.string   "title",                              null: false
    t.string   "photo",                              null: false
    t.text     "content",                            null: false
    t.boolean  "enable",              default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["gallery_category_id"], name: "index_galleries_on_gallery_category_id"

  create_table "gallery_categories", force: true do |t|
    t.string   "title",                          null: false
    t.integer  "galleries_count", default: 0,    null: false
    t.boolean  "enable",          default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_book_comments", force: true do |t|
    t.integer  "guest_book_id",                 null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "encrypted_password", limit: 40
    t.string   "salt"
    t.text     "content",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guest_book_comments", ["guest_book_id"], name: "index_guest_book_comments_on_guest_book_id"
  add_index "guest_book_comments", ["user_id"], name: "index_guest_book_comments_on_user_id"

  create_table "guest_book_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "guest_books", force: true do |t|
    t.integer  "user_id"
    t.string   "title",                     limit: 60,                null: false
    t.string   "name",                      limit: 60
    t.string   "encrypted_password",        limit: 40
    t.string   "salt"
    t.integer  "guest_book_comments_count",            default: 0,    null: false
    t.boolean  "enable",                               default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guest_books", ["user_id"], name: "index_guest_books_on_user_id"

  create_table "histories", force: true do |t|
    t.integer  "user_id",               null: false
    t.string   "year",       limit: 40, null: false
    t.string   "title",      limit: 60, null: false
    t.text     "content",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["user_id"], name: "index_histories_on_user_id"

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

  create_table "intro", force: true do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intro_photos", force: true do |t|
    t.string   "title",      limit: 60, null: false
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notice_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "notices", force: true do |t|
    t.integer  "user_id",                              null: false
    t.string   "title",      limit: 60,                null: false
    t.boolean  "enable",                default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id"

  create_table "portfolio_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "portfolios", force: true do |t|
    t.string   "title",       null: false
    t.string   "url",         null: false
    t.text     "description", null: false
    t.string   "photo",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_photos", force: true do |t|
    t.string   "title",      limit: 60, null: false
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposes", force: true do |t|
    t.integer  "user_id",                              null: false
    t.string   "title",      limit: 60,                null: false
    t.text     "content"
    t.boolean  "enabled",               default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposes", ["user_id"], name: "index_proposes_on_user_id"

  create_table "question_comments", force: true do |t|
    t.integer  "question_id",                   null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "encrypted_password", limit: 40
    t.string   "salt"
    t.text     "content",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_comments", ["question_id"], name: "index_question_comments_on_question_id"
  add_index "question_comments", ["user_id"], name: "index_question_comments_on_user_id"

  create_table "question_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.string   "title",                   limit: 60,                null: false
    t.string   "name",                    limit: 60
    t.string   "encrypted_password",      limit: 40
    t.string   "salt"
    t.integer  "secret",                             default: 0,    null: false
    t.integer  "question_comments_count",            default: 0,    null: false
    t.boolean  "enable",                             default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "report_categories", force: true do |t|
    t.string   "title",         limit: 60,                null: false
    t.integer  "reports_count",            default: 0,    null: false
    t.boolean  "enabled",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_contents", force: true do |t|
    t.text "content", null: false
  end

  create_table "reports", force: true do |t|
    t.integer  "report_category_id",                              null: false
    t.integer  "user_id",                                         null: false
    t.string   "title",                 limit: 60,                null: false
    t.integer  "report_comments_count",            default: 0,    null: false
    t.boolean  "enabled",                          default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["report_category_id"], name: "index_reports_on_report_category_id"
  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "resource_photos", force: true do |t|
    t.integer  "resource_id",                           null: false
    t.string   "photo",                                 null: false
    t.string   "alt",         limit: 60,                null: false
    t.boolean  "enable",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resource_photos", ["resource_id"], name: "index_resource_photos_on_resource_id"

  create_table "resources", force: true do |t|
    t.integer  "ad_position_id",                              null: false
    t.string   "title",          limit: 60,                   null: false
    t.string   "description"
    t.string   "controller",     limit: 60,                   null: false
    t.string   "menu_action",    limit: 60, default: "index", null: false
    t.boolean  "use_category",              default: false,   null: false
    t.boolean  "menu_display",              default: true,    null: false
    t.integer  "per",                       default: 10,      null: false
    t.boolean  "desc",                      default: true,    null: false
    t.boolean  "enable",                    default: true,    null: false
    t.integer  "priority",                  default: 100,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["ad_position_id"], name: "index_resources_on_ad_position_id"
  add_index "resources", ["controller"], name: "index_resources_on_controller", unique: true
  add_index "resources", ["title"], name: "index_resources_on_title", unique: true

  create_table "settings", force: true do |t|
    t.integer  "theme_id",   null: false
    t.string   "favicon"
    t.boolean  "use_header", null: false
    t.boolean  "use_footer", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["theme_id"], name: "index_settings_on_theme_id"

  create_table "themes", force: true do |t|
    t.string   "title"
    t.boolean  "enable",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                  null: false
    t.string   "name",                                   null: false
    t.string   "description",                            null: false
    t.string   "encrypted_password",                     null: false
    t.string   "photo"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
