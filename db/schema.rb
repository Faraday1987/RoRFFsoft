# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_23_195352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "imageurl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "nombre"
    t.string "imageurl"
    t.string "country"
    t.string "address"
    t.string "address2"
    t.string "cp"
    t.string "city"
    t.string "state"
    t.string "contact_name"
    t.string "email"
    t.string "phone"
    t.float "commission_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "nombre"
    t.text "description"
    t.text "images"
    t.string "imagen"
    t.decimal "oldprpriceice"
    t.decimal "oldprice"
    t.decimal "realprice"
    t.string "warehouse"
    t.boolean "is_active"
    t.decimal "existencekg"
    t.integer "existence"
    t.decimal "weight"
    t.integer "category_id"
    t.integer "supplier_id"
    t.decimal "commission_for_sale"
    t.decimal "commission_amount"
    t.bigint "categories_id", null: false
    t.bigint "suppliers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_products_on_categories_id"
    t.index ["suppliers_id"], name: "index_products_on_suppliers_id"
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "product_id", null: false
    t.bigint "sale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sale_details_on_product_id"
    t.index ["sale_id"], name: "index_sale_details_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "importe"
    t.float "amount"
    t.date "date"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name"
    t.string "imageurl"
    t.string "country"
    t.string "address"
    t.string "address2"
    t.string "cp"
    t.string "city"
    t.boolean "is_active"
    t.string "contact_name"
    t.string "email"
    t.string "phone"
    t.string "phone2"
    t.float "commission_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre"
    t.boolean "isAdmin"
    t.string "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouse_records", force: :cascade do |t|
    t.integer "user_id"
    t.bigint "supplier_id", null: false
    t.bigint "product_id", null: false
    t.integer "cantidad"
    t.integer "disponible"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_warehouse_records_on_product_id"
    t.index ["supplier_id"], name: "index_warehouse_records_on_supplier_id"
  end

  add_foreign_key "products", "categories", column: "categories_id"
  add_foreign_key "products", "suppliers", column: "suppliers_id"
  add_foreign_key "sale_details", "products"
  add_foreign_key "sale_details", "sales"
  add_foreign_key "warehouse_records", "products"
  add_foreign_key "warehouse_records", "suppliers"
end
