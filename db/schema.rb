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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_104951) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "external_id"
    t.string "latest_investment_stage"
    t.date "latest_investment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_companies_on_external_id", unique: true
  end

  create_table "investments", force: :cascade do |t|
    t.string "company_name"
    t.integer "company_external_id"
    t.integer "investment_size"
    t.string "stage"
    t.date "investment_date"
  end

end
