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

ActiveRecord::Schema.define(:version => 20120329211557) do

  create_table "bohconf_sessions", :force => true do |t|
    t.string   "title"
    t.text     "abstract"
    t.string   "host_name"
    t.string   "host_email"
    t.string   "host_twitter"
    t.text     "host_bio"
    t.string   "session_type",   :default => "hack session"
    t.text     "suggested_time"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "hide",           :default => false,          :null => false
    t.string   "token"
  end

  create_table "favorites", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "approved",    :default => false, :null => false
  end

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "twitter"
    t.string   "phone"
    t.text     "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.string   "twitter"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "number_of_guests"
    t.integer  "number_of_guests_remaining"
    t.text     "description"
    t.string   "email"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "approved",                   :default => false, :null => false
  end

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "abstract"
    t.text     "bio"
    t.string   "twitter"
    t.string   "email"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "hide",       :default => false, :null => false
  end

  create_table "twitter_accounts", :force => true do |t|
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.string   "oauth_token_verifier"
    t.text     "oauth_authorize_url"
    t.text     "stream_url"
    t.string   "screen_name"
    t.boolean  "active",               :default => true, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

end
