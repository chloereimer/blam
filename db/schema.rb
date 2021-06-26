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

ActiveRecord::Schema.define(version: 2021_06_26_125623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "item_score"
    t.integer "level_requirement"
    t.string "rarity"
    t.float "damage_per_projectile"
    t.float "number_of_projectiles"
    t.float "accuracy"
    t.float "handling"
    t.float "reload_time"
    t.float "fire_rate"
    t.float "magazine_size"
    t.float "ammo_consumed_per_shot", default: 1.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
