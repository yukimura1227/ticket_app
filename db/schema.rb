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

ActiveRecord::Schema.define(version: 20191117031622) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "color_code", null: false
    t.string "color_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_links_on_stage_id"
    t.index ["type_id"], name: "index_links_on_type_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.integer "discount_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", default: "", null: false
  end

  create_table "registers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "count"
    t.string "b_name"
    t.string "b_email"
    t.integer "stage_id"
    t.integer "type_id"
    t.text "comment"
    t.integer "state", default: 0
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "furigana"
    t.integer "payment_method_id", default: 0, null: false
    t.index ["stage_id"], name: "index_registers_on_stage_id"
    t.index ["ticket_id"], name: "index_registers_on_ticket_id"
    t.index ["type_id"], name: "index_registers_on_type_id"
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "performance"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deadline"
    t.boolean "end_flag", default: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "count"
    t.string "b_name"
    t.string "b_mail"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stage_id"
    t.integer "type_id"
    t.text "comment2"
    t.string "furigana"
    t.integer "payment_method_id", default: 0, null: false
    t.index ["stage_id"], name: "index_tickets_on_stage_id"
    t.index ["type_id"], name: "index_tickets_on_type_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "kind"
    t.integer "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "color_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
