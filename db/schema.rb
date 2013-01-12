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

ActiveRecord::Schema.define(:version => 20130112182722) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "award_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "award_category_translations", :force => true do |t|
    t.integer  "award_category_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "award_category_translations", ["award_category_id"], :name => "index_award_category_translations_on_award_category_id"
  add_index "award_category_translations", ["locale"], :name => "index_award_category_translations_on_locale"

  create_table "awards", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "ended"
  end

  create_table "categories", :force => true do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expert_translations", :force => true do |t|
    t.integer  "expert_id"
    t.string   "locale"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.text     "description"
    t.text     "position"
    t.string   "post"
    t.string   "workplace"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "expert_translations", ["expert_id"], :name => "index_expert_translations_on_expert_id"
  add_index "expert_translations", ["locale"], :name => "index_expert_translations_on_locale"

  create_table "experts", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "photo"
    t.integer  "category_id"
    t.integer  "partner_id"
    t.text     "description"
    t.text     "position"
    t.string   "post"
    t.string   "workplace"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "galleries", :force => true do |t|
    t.integer  "award_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "image_translations", :force => true do |t|
    t.integer  "image_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "image_translations", ["image_id"], :name => "index_image_translations_on_image_id"
  add_index "image_translations", ["locale"], :name => "index_image_translations_on_locale"

  create_table "images", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "file"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "jurors", :force => true do |t|
    t.integer  "expert_id"
    t.integer  "award_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monthly_experts", :force => true do |t|
    t.integer  "expert_id"
    t.integer  "month_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "months", :force => true do |t|
    t.date     "month"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "slug"
    t.string   "logo"
    t.string   "title"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "award_id"
    t.boolean  "announcement"
    t.boolean  "online"
    t.string   "published_by"
    t.string   "publish_url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "news_translations", :force => true do |t|
    t.integer  "news_id"
    t.string   "locale"
    t.text     "content"
    t.string   "title"
    t.string   "published_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "news_translations", ["locale"], :name => "index_news_translations_on_locale"
  add_index "news_translations", ["news_id"], :name => "index_news_translations_on_news_id"

  create_table "nominee_translations", :force => true do |t|
    t.integer  "nominee_id"
    t.string   "locale"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "nominee_translations", ["locale"], :name => "index_nominee_translations_on_locale"
  add_index "nominee_translations", ["nominee_id"], :name => "index_nominee_translations_on_nominee_id"

  create_table "nominees", :force => true do |t|
    t.integer  "region_id"
    t.integer  "award_id"
    t.integer  "award_category_id"
    t.date     "date"
    t.string   "title"
    t.text     "description"
    t.boolean  "winner"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "opinion_translations", :force => true do |t|
    t.integer  "opinion_id"
    t.string   "locale"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "opinion_translations", ["locale"], :name => "index_opinion_translations_on_locale"
  add_index "opinion_translations", ["opinion_id"], :name => "index_opinion_translations_on_opinion_id"

  create_table "opinions", :force => true do |t|
    t.integer  "expert_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "logo"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "ratings", :force => true do |t|
    t.date     "date"
    t.integer  "region_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.string   "emblem"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "video_translations", :force => true do |t|
    t.integer  "video_id"
    t.string   "locale"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "video_translations", ["locale"], :name => "index_video_translations_on_locale"
  add_index "video_translations", ["video_id"], :name => "index_video_translations_on_video_id"

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "thumb"
    t.text     "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
