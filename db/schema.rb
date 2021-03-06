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

ActiveRecord::Schema.define(:version => 20130311085157) do

  create_table "birth_years", :force => true do |t|
    t.integer  "name_id"
    t.integer  "birth_year"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  add_index "birth_years", ["birth_year"], :name => "index_birth_years_on_birth_year"
  add_index "birth_years", ["count"], :name => "index_birth_years_on_count"
  add_index "birth_years", ["name_id"], :name => "index_birth_years_on_name_id"

  create_table "district_names", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
  end

  add_index "district_names", ["name"], :name => "index_district_names_on_name"
  add_index "district_names", ["name_en"], :name => "index_district_names_on_name_en"

  create_table "district_years", :force => true do |t|
    t.integer  "district_id"
    t.integer  "birth_year"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "district_years", ["birth_year"], :name => "index_district_years_on_birth_year"
  add_index "district_years", ["district_id"], :name => "index_district_years_on_district_id"

  create_table "districts", :force => true do |t|
    t.integer  "name_id"
    t.integer  "district_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  add_index "districts", ["count"], :name => "index_districts_on_count"
  add_index "districts", ["district_id"], :name => "index_districts_on_district_id"
  add_index "districts", ["name_id"], :name => "index_districts_on_name_id"

  create_table "mappings", :force => true do |t|
    t.integer  "first_name_id"
    t.integer  "last_name_id"
    t.integer  "birth_year"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mappings", ["birth_year"], :name => "index_mappings_on_birth_year"
  add_index "mappings", ["district_id"], :name => "index_mappings_on_district_id"
  add_index "mappings", ["first_name_id", "last_name_id"], :name => "index_mappings_on_first_name_id_and_last_name_id"

  create_table "name_totals", :force => true do |t|
    t.integer  "identifier"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_type"
  end

  add_index "name_totals", ["count"], :name => "index_name_totals_on_count"
  add_index "name_totals", ["total_type", "identifier"], :name => "index_name_totals_on_total_type_and_identifier"

  create_table "names", :force => true do |t|
    t.integer  "name_type"
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
    t.string   "name_en"
    t.string   "permalink"
  end

  add_index "names", ["count"], :name => "index_names_on_count"
  add_index "names", ["name_en"], :name => "index_names_on_name_en"
  add_index "names", ["name_type", "count"], :name => "idx_name_type_count"
  add_index "names", ["name_type", "name"], :name => "idx_names"
  add_index "names", ["permalink"], :name => "index_names_on_permalink"

  create_table "people", :force => true do |t|
    t.integer  "first_name_id"
    t.integer  "last_name_id"
    t.integer  "count"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["first_name_id"], :name => "index_people_on_first_name_id"
  add_index "people", ["last_name_id"], :name => "index_people_on_last_name_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "role",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "will_filter_filters", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "will_filter_filters", ["user_id"], :name => "index_will_filter_filters_on_user_id"

end
