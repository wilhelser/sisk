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

ActiveRecord::Schema.define(version: 20140918135851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assets", force: true do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "benefits", force: true do |t|
    t.string   "title",           null: false
    t.string   "subtitle"
    t.text     "content",         null: false
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_one_text"
    t.string   "link_two"
    t.string   "link_two_text"
    t.string   "link_three"
    t.string   "link_three_text"
    t.integer  "category_id"
    t.integer  "position"
  end

  create_table "benefits_sections", id: false, force: true do |t|
    t.integer "benefit_id"
    t.integer "section_id"
  end

  add_index "benefits_sections", ["benefit_id", "section_id"], name: "index_benefits_sections_on_benefit_id_and_section_id", using: :btree
  add_index "benefits_sections", ["section_id", "benefit_id"], name: "index_benefits_sections_on_section_id_and_benefit_id", using: :btree

  create_table "benefits_sites", id: false, force: true do |t|
    t.integer "benefit_id"
    t.integer "site_id"
  end

  add_index "benefits_sites", ["benefit_id", "site_id"], name: "index_benefits_sites_on_benefit_id_and_site_id", using: :btree
  add_index "benefits_sites", ["site_id", "benefit_id"], name: "index_benefits_sites_on_site_id_and_benefit_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "title",      limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configurations", force: true do |t|
    t.string   "identity_iq_protect_link",     limit: 180
    t.string   "identity_iq_pro_link",         limit: 180
    t.string   "identity_iq_protect_max_link", limit: 180
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_sections", force: true do |t|
    t.text     "intro_content"
    t.text     "health_content"
    t.text     "insurance_content"
    t.text     "savings_content"
    t.text     "security_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_sites", force: true do |t|
    t.string   "name",             limit: 60
    t.string   "url",              limit: 60
    t.string   "company_name",     limit: 60
    t.string   "city",             limit: 60
    t.string   "state",            limit: 30
    t.string   "zip_code",         limit: 10
    t.string   "primary_color",    limit: 10
    t.string   "secondary_color",  limit: 10
    t.string   "link_color",       limit: 10
    t.string   "link_color_hover", limit: 10
    t.string   "club_name",        limit: 60
    t.string   "bank_website",     limit: 60
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template",         limit: 20
    t.string   "account_number",   limit: 60
    t.string   "logo"
    t.integer  "login_code"
    t.integer  "content_section",  limit: 2
  end

  create_table "home_sections_sites", id: false, force: true do |t|
    t.integer "home_section_id"
    t.integer "site_id"
  end

  add_index "home_sections_sites", ["home_section_id", "site_id"], name: "index_home_sections_sites_on_home_section_id_and_site_id", using: :btree
  add_index "home_sections_sites", ["site_id", "home_section_id"], name: "index_home_sections_sites_on_site_id_and_home_section_id", using: :btree

  create_table "sections", force: true do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "site_configs", force: true do |t|
    t.string   "identity_iq_protect_link",     limit: 180
    t.string   "identity_iq_pro_link",         limit: 180
    t.string   "identity_iq_protect_max_link", limit: 180
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_code",                   null: false
    t.string   "city",             limit: 50
    t.string   "state",            limit: 2
    t.integer  "zip_code",         limit: 8
    t.integer  "account_number"
    t.string   "logo"
    t.string   "primary_color",    limit: 7
    t.string   "secondary_color",  limit: 7
    t.string   "link_color",       limit: 7
    t.string   "link_color_hover", limit: 7
    t.string   "club_name"
    t.string   "bank_website"
    t.string   "slug"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "site_id"
    t.string   "first_name",             limit: 60
    t.string   "last_name",              limit: 60
    t.string   "member_id",              limit: 10
    t.integer  "login_code"
    t.boolean  "email_updates",                     default: false
    t.string   "uuid",                   limit: 10
    t.boolean  "ent_registered",                    default: false
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
