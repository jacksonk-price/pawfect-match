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

ActiveRecord::Schema[7.0].define(version: 2023_06_30_224538) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_choices", force: :cascade do |t|
    t.string "text"
    t.integer "value"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "family_score"
    t.integer "children_score"
    t.integer "other_dog_score"
    t.integer "shedding_score"
    t.integer "grooming_score"
    t.integer "drooling_score"
    t.integer "stranger_score"
    t.integer "playfulness_score"
    t.integer "protective_score"
    t.integer "adaptability_score"
    t.integer "trainability_score"
    t.integer "energy_score"
    t.integer "barking_score"
    t.integer "mental_stim_score"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "question_answer_choices", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "answer_choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_choice_id"], name: "index_question_answer_choices_on_answer_choice_id"
    t.index ["question_id"], name: "index_question_answer_choices_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.integer "order"
    t.string "survey_attribute_name"
  end

  create_table "suggested_breeds", force: :cascade do |t|
    t.integer "dog_id"
    t.bigint "survey_result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_result_id"], name: "index_suggested_breeds_on_survey_result_id"
  end

  create_table "survey_results", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash_id"
    t.string "slug"
    t.index ["slug"], name: "index_survey_results_on_slug", unique: true
    t.index ["survey_id"], name: "index_survey_results_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name_input"
    t.integer "family_input"
    t.integer "children_input"
    t.integer "other_dog_input"
    t.integer "shedding_input"
    t.integer "grooming_input"
    t.integer "drooling_input"
    t.integer "stranger_input"
    t.integer "playfulness_input"
    t.integer "protective_input"
    t.integer "adaptability_input"
    t.integer "trainability_input"
    t.integer "energy_input"
    t.integer "barking_input"
    t.integer "mental_stim_input"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "size_input"
  end

  add_foreign_key "question_answer_choices", "answer_choices"
  add_foreign_key "question_answer_choices", "questions"
  add_foreign_key "suggested_breeds", "survey_results"
  add_foreign_key "survey_results", "surveys"
end
