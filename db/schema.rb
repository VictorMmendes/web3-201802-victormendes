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

ActiveRecord::Schema.define(version: 2018_11_28_180921) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.date "birthdate"
    t.string "cpf"
    t.string "cnpj"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "cpf"
    t.string "rg"
    t.string "work_permit"
    t.date "hiring"
    t.date "birthdate"
    t.float "salary"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.integer "storage"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "fancy_name"
    t.string "cnpj"
    t.string "cpf"
    t.date "register_date"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "amount"
    t.float "unit_price"
    t.float "total_price"
    t.datetime "date"
    t.integer "employee_id"
    t.integer "provider_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_purchases_on_employee_id"
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["provider_id"], name: "index_purchases_on_provider_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "amount"
    t.float "unit_price"
    t.float "total_price"
    t.datetime "date"
    t.integer "employee_id"
    t.integer "client_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["employee_id"], name: "index_sales_on_employee_id"
    t.index ["item_id"], name: "index_sales_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
