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

ActiveRecord::Schema.define(:version => 20120205162949) do

  create_table "chore_instances", :force => true do |t|
    t.decimal  "price",      :precision => 8, :scale => 2
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "expenseds", :force => true do |t|
    t.integer  "expense_id"
    t.integer  "resident_id"
    t.decimal  "amount",      :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "expenseds", ["expense_id"], :name => "index_expenseds_on_expense_id"
  add_index "expenseds", ["resident_id"], :name => "index_expenseds_on_resident_id"

  create_table "expenses", :force => true do |t|
    t.integer  "payer_id"
    t.decimal  "amount",     :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "expenses", ["payer_id"], :name => "index_expenses_on_payer_id"

  create_table "households", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "residents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "household_id"
    t.boolean  "active",       :default => true, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "settlements", :force => true do |t|
    t.integer  "initiator_id"
    t.integer  "payer_id"
    t.integer  "payee_id"
    t.boolean  "confirmed"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.decimal  "amount",       :precision => 8, :scale => 2
  end

  add_index "settlements", ["initiator_id"], :name => "index_settlements_on_initiator_id"
  add_index "settlements", ["payee_id"], :name => "index_settlements_on_payee_id"
  add_index "settlements", ["payer_id"], :name => "index_settlements_on_payer_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
