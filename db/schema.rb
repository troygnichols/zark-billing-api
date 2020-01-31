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

ActiveRecord::Schema.define(version: 2018_08_05_164800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", id: :serial, force: :cascade do |t|
    t.string "entity_name"
    t.string "client_name"
    t.string "invoice_id"
    t.string "issue_date"
    t.string "due_date"
    t.string "subject"
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "paid_date"
    t.text "entity_address"
    t.bigint "user_id"
    t.index ["client_name", "invoice_id", "user_id"], name: "invoices_client_name_user_id_invoice_id", unique: true
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "item_type"
    t.string "description"
    t.float "quantity"
    t.float "unit_price"
    t.integer "invoice_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.boolean "active", default: false
    t.string "activation_digest"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "users_email_unique", unique: true
  end

end
