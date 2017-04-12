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

ActiveRecord::Schema.define(version: 20170412060215) do

  create_table "billing_reply_packs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "cost",       limit: 24
    t.integer  "amount",     limit: 4
    t.integer  "spent",      limit: 4,  default: 0,    null: false
    t.boolean  "available",             default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "billing_reply_subscriptions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.float    "cost",        limit: 24
    t.datetime "active_from"
    t.datetime "active_to"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "billing_task_autorefreshes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.float    "cost",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "billing_task_blogs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.float    "cost",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "billing_task_colors", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.float    "cost",       limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "billing_task_packs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "cost",       limit: 24
    t.integer  "amount",     limit: 4
    t.integer  "spent",      limit: 4,  default: 0,    null: false
    t.boolean  "available",             default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "billing_task_subscriptions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.float    "cost",        limit: 24
    t.datetime "active_from"
    t.datetime "active_to"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "billing_transfer_manually", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "admin_id",   limit: 4
    t.float    "amount",     limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.integer  "parent_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "lft",            limit: 4
    t.integer  "rgt",            limit: 4
    t.integer  "depth",          limit: 4
    t.integer  "children_count", limit: 4
    t.string   "photo",          limit: 255
    t.integer  "position",       limit: 4
  end

  create_table "contract_categories", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "contract_templates", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "category_id", limit: 4
    t.text     "markup",      limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "template_id", limit: 4
    t.text     "data",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "help_answers", force: :cascade do |t|
    t.integer "help_category_id", limit: 4
    t.string  "title",            limit: 255
    t.text    "content",          limit: 65535
    t.text    "synonyms",         limit: 65535
    t.integer "position",         limit: 4
  end

  create_table "help_categories", force: :cascade do |t|
    t.string  "title",    limit: 255
    t.integer "position", limit: 4
  end

  create_table "help_questions", force: :cascade do |t|
    t.string  "name",     limit: 255
    t.string  "email",    limit: 255
    t.text    "content",  limit: 65535
    t.text    "reply",    limit: 65535
    t.boolean "answered",               default: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "photo",      limit: 255
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "message",         limit: 255
    t.string   "state",           limit: 255
    t.text     "params",          limit: 65535
    t.string   "notifiable_type", limit: 255
    t.integer  "notifiable_id",   limit: 4
    t.datetime "read_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.text     "content",    limit: 65535
    t.boolean  "draft"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "place_type_names", force: :cascade do |t|
    t.integer  "level",            limit: 4
    t.integer  "code",             limit: 4
    t.string   "name",             limit: 255
    t.string   "full_name",        limit: 255
    t.string   "alt_name",         limit: 255
    t.boolean  "after_place_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "places", force: :cascade do |t|
    t.string  "fias_aoguid",        limit: 255
    t.string  "name",               limit: 255
    t.string  "full_name",          limit: 255
    t.integer "level",              limit: 4
    t.integer "place_type",         limit: 4
    t.integer "place_type_name_id", limit: 4
    t.integer "parent_place_id",    limit: 4
    t.integer "region_place_id",    limit: 4
    t.boolean "is_region_center"
    t.boolean "is_center"
    t.boolean "custom"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,     null: false
    t.string   "work_type",     limit: 255
    t.string   "pay_type",      limit: 255
    t.boolean  "have_car"
    t.boolean  "have_truck"
    t.text     "about",         limit: 65535
    t.integer  "place_id",      limit: 4
    t.float    "place_lat",     limit: 24
    t.float    "place_long",    limit: 24
    t.string   "place_address", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "task_id",       limit: 4
    t.integer  "user_id",       limit: 4
    t.string   "status",        limit: 255
    t.text     "content",       limit: 65535
    t.string   "billable_type", limit: 255
    t.integer  "billable_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer  "profile_id", limit: 4
    t.string   "title",      limit: 255
    t.integer  "price",      limit: 4
    t.string   "price_type", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sms_confirmations", force: :cascade do |t|
    t.string   "token",        limit: 255
    t.string   "phone",        limit: 255
    t.string   "code",         limit: 255
    t.boolean  "accepted",                 default: false
    t.integer  "attempts",     limit: 4,   default: 0
    t.datetime "last_sent_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.integer  "profile_id",  limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",         limit: 255,                   null: false
    t.integer  "category_id",   limit: 4,                     null: false
    t.integer  "user_id",       limit: 4,                     null: false
    t.string   "price_type",    limit: 255,                   null: false
    t.string   "price_scale",   limit: 255
    t.integer  "price_exact",   limit: 4
    t.integer  "price_from",    limit: 4
    t.integer  "price_to",      limit: 4
    t.integer  "place_id",      limit: 4
    t.float    "place_lat",     limit: 24
    t.float    "place_long",    limit: 24
    t.string   "place_address", limit: 255
    t.string   "date_type",     limit: 255,                   null: false
    t.integer  "date_actual",   limit: 4
    t.datetime "date_from"
    t.datetime "date_to"
    t.string   "contract_type", limit: 255
    t.text     "description",   limit: 65535
    t.boolean  "notify_email"
    t.boolean  "visible",                     default: true
    t.boolean  "archive"
    t.boolean  "colored",                     default: false
    t.string   "billable_type", limit: 255
    t.integer  "billable_id",   limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "user_billing_logs", force: :cascade do |t|
    t.float    "sum",           limit: 24
    t.integer  "user_id",       limit: 4
    t.string   "billable_type", limit: 255
    t.integer  "billable_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_permissions", force: :cascade do |t|
    t.text     "data",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",  null: false
    t.string   "encrypted_password",     limit: 255, default: "",  null: false
    t.string   "first_name",             limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "last_name",              limit: 255
    t.string   "phone",                  limit: 255
    t.string   "skype",                  limit: 255
    t.string   "website",                limit: 255
    t.date     "birthday"
    t.integer  "profile_id",             limit: 4
    t.integer  "free_tasks_published",   limit: 4,   default: 0,   null: false
    t.integer  "free_replies_published", limit: 4,   default: 0,   null: false
    t.float    "balance",                limit: 24,  default: 0.0, null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "photo",                  limit: 255
    t.boolean  "phone_confirmed"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string  "title",             limit: 255
    t.text    "small_description", limit: 65535
    t.text    "description",       limit: 65535
    t.integer "position",          limit: 4
    t.boolean "archive",                         default: false
  end

end
