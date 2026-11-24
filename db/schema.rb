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

ActiveRecord::Schema[8.1].define(version: 2026_11_24_055634) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.bigint "sensor_id", null: false
    t.string "severity"
    t.text "message"
    t.boolean "acknowledged", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_alerts_on_sensor_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "location"
    t.string "status", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensor_readings", force: :cascade do |t|
    t.bigint "sensor_id", null: false
    t.decimal "value"
    t.datetime "recorded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_sensor_readings_on_sensor_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.bigint "equipment_id", null: false
    t.string "name"
    t.string "sensor_type"
    t.string "unit"
    t.decimal "warning_threshold", precision: 10, scale: 2
    t.decimal "critical_threshold", precision: 10, scale: 2
    t.string "api_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_sensors_on_equipment_id"
  end

  add_foreign_key "alerts", "sensors"
  add_foreign_key "sensor_readings", "sensors"
  add_foreign_key "sensors", "equipment"
end
