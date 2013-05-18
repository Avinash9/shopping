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

ActiveRecord::Schema.define(:version => 20130427090043) do

  create_table "order_items", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "product_qty"
    t.integer  "product_unit_price"
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "status"
    t.string   "cc_type"
    t.string   "card_no"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "name"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "price"
    t.string   "category"
    t.string   "related_type"
    t.string   "old_new"
    t.string   "image_url"
  end

  create_table "shoppingcarts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "quantity"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "username"
    t.string   "hashed_password"
    t.string   "user_type"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.integer  "bday_day"
    t.integer  "bday_month"
    t.integer  "bday_year"
    t.string   "s_addr_str_no"
    t.string   "s_addr_str_name"
    t.string   "s_addr_city"
    t.string   "s_addr_state"
    t.integer  "s_addr_zip"
    t.string   "b_addr_str_no"
    t.string   "b_addr_str_name"
    t.string   "b_addr_city"
    t.string   "b_addr_state"
    t.integer  "b_addr_zip"
    t.boolean  "shipping_billing_same"
    t.string   "email"
    t.string   "salt"
  end

end
