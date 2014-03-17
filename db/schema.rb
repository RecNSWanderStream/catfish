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

ActiveRecord::Schema.define(version: 20140316233621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "activity_categories", force: true do |t|
    t.integer  "asset_type_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_categories", ["name"], :name => "index_activity_categories_on_name", :unique => true

  create_table "activity_types", force: true do |t|
    t.integer  "activity_category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_types", ["name"], :name => "index_activity_types_on_name", :unique => true

  create_table "asset_activities", force: true do |t|
    t.integer  "asset_id"
    t.integer  "activity_type_id"
    t.integer  "duration"
    t.string   "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "user_rating",        precision: 5, scale: 2
    t.decimal  "difficulty_rating",  precision: 5, scale: 2
    t.boolean  "is_loop"
    t.decimal  "distance",           precision: 5, scale: 2
    t.binary   "dynamic_attributes"
  end

  create_table "asset_category_templates", force: true do |t|
    t.integer  "activity_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asset_cell_providers", force: true do |t|
    t.integer  "asset_id"
    t.integer  "cell_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asset_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asset_types", ["name"], :name => "index_asset_types_on_name", :unique => true

  create_table "assets", force: true do |t|
    t.integer  "asset_type_id"
    t.integer  "profile_id"
    t.integer  "region_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "lat",                                                             precision: 9, scale: 6
    t.decimal  "lng",                                                             precision: 9, scale: 6
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active"
    t.integer  "nearest_city_id"
    t.boolean  "washrooms"
    t.boolean  "parking"
    t.boolean  "accessibility_access"
    t.text     "accessibility_information"
    t.string   "time_open"
    t.string   "time_closed"
    t.boolean  "public_transit"
    t.spatial  "closest_stop_location",     limit: {:srid=>0, :type=>"geometry"}
    t.spatial  "location",                  limit: {:srid=>0, :type=>"geometry"}
  end

  create_table "cities", force: true do |t|
    t.integer  "province_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "location",    limit: {:srid=>0, :type=>"geometry"}
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "shape",       limit: {:srid=>0, :type=>"geometry"}
  end

  create_table "revisions", force: true do |t|
    t.integer  "asset_id"
    t.integer  "old_revision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "template_attributes", force: true do |t|
    t.integer  "asset_category_template_id"
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
