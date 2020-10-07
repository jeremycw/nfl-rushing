# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_06_211057) do

  create_table "rushes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.string "position"
    t.integer "attempts"
    t.float "attempts_per_game"
    t.integer "yards"
    t.float "avg_yards"
    t.float "yards_per_game"
    t.integer "touchdowns"
    t.integer "longest_rush"
    t.integer "first_downs"
    t.float "first_down_percent"
    t.integer "over_20_yards"
    t.integer "over_40_yards"
    t.integer "fumbles"
  end

end
