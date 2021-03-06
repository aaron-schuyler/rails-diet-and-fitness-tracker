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

ActiveRecord::Schema.define(version: 2020_07_30_195846) do

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.integer "user_id"
    t.integer "workout_id"
    t.integer "weight"
    t.index ["user_id"], name: "index_days_on_user_id"
    t.index ["workout_id"], name: "index_days_on_workout_id"
  end

  create_table "days_meals", id: false, force: :cascade do |t|
    t.integer "day_id", null: false
    t.integer "meal_id", null: false
    t.string "meal_type"
    t.index ["day_id"], name: "index_days_meals_on_day_id"
    t.index ["meal_id"], name: "index_days_meals_on_meal_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.boolean "time_based"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "calories_burned"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.integer "protein"
    t.integer "carbs"
    t.integer "fat"
    t.integer "fiber"
    t.integer "sugar"
    t.text "descritpion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_meals", id: false, force: :cascade do |t|
    t.integer "meal_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "servings"
    t.index ["ingredient_id", "meal_id"], name: "index_ingredients_meals_on_ingredient_id_and_meal_id", unique: true
    t.index ["meal_id", "ingredient_id"], name: "index_ingredients_meals_on_meal_id_and_ingredient_id", unique: true
  end

  create_table "meals", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "descritpion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.integer "calories_target"
    t.integer "protein_target"
    t.integer "fat_target"
    t.integer "carbs_target"
    t.integer "fiber_target"
    t.integer "sugar_target"
    t.integer "weight"
    t.string "gender"
    t.boolean "setup", default: false
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "amount"
    t.integer "day_id"
    t.integer "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_workouts_on_day_id"
    t.index ["exercise_id"], name: "index_workouts_on_exercise_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

end
