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

ActiveRecord::Schema.define(version: 2021_07_02_182051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "weapons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "item_score", null: false
    t.integer "level_requirement", null: false
    t.string "rarity", null: false
    t.float "damage_per_projectile", null: false
    t.float "number_of_projectiles", null: false
    t.float "accuracy", null: false
    t.float "handling", null: false
    t.float "reload_time", null: false
    t.float "fire_rate", null: false
    t.float "magazine_size", null: false
    t.float "ammo_consumed_per_shot", default: 1.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "element"
    t.string "status_effect_element"
    t.float "status_effect_damage"
    t.float "status_effect_chance"
  end

end
