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

ActiveRecord::Schema.define(version: 20160916175106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csus_scores", force: :cascade do |t|
    t.integer  "reduces_the_risk_of_clinical_error"
    t.integer  "support_is_hard_to_access"
    t.integer  "improves_quality_clinical_care"
    t.integer  "consultation_adversely_affected"
    t.integer  "gives_me_key_information_needed"
    t.integer  "total_csus_score"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "review_id"
  end

  add_index "csus_scores", ["review_id"], name: "index_csus_scores_on_review_id", using: :btree

  create_table "hospitals", force: :cascade do |t|
    t.text     "hospital_name"
    t.string   "hospital_post_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "trust_id"
  end

  add_index "hospitals", ["trust_id"], name: "index_hospitals_on_trust_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "review_title"
    t.text     "review_positive_text"
    t.decimal  "sus_score_placeholder"
    t.decimal  "csus_score_placeholder"
    t.integer  "star_rating"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id"
    t.integer  "number_of_views",                    default: 0
    t.integer  "likes",                              default: 0
    t.integer  "dislikes",                           default: 0
    t.text     "review_negative_text"
    t.text     "trust_type"
    t.text     "trust_name"
    t.integer  "trust_id"
    t.text     "system_name"
    t.integer  "csus_response_id"
    t.text     "user_category"
    t.integer  "system_id"
    t.integer  "reduces_the_risk_of_clinical_error"
    t.integer  "support_is_hard_to_access"
    t.integer  "improves_quality_clinical_care"
    t.integer  "consultation_adversely_affected"
    t.integer  "gives_me_key_information_needed"
    t.integer  "total_csus_score"
  end

  add_index "reviews", ["system_id"], name: "index_reviews_on_system_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "sus_scores", force: :cascade do |t|
    t.integer "i_would_like_to_use_this_system_frequently"
    t.integer "the_system_is_unnecessarily_complex"
    t.integer "the_system_is_easy_to_use"
    t.integer "i_need_frequent_technical_support_to_use_this_system"
    t.integer "the_various_functions_in_this_system_are_well_integrated"
    t.integer "there_is_too_much_inconsistency_in_this_system"
    t.integer "most_people_would_learn_to_use_this_system_very_quickly"
    t.integer "the_system_was_very_cumbersome_to_use"
    t.integer "i_feel_confident_using_this_system"
    t.integer "i_needed_to_learn_a_lot_of_things_before_i_could_get_going_with"
    t.decimal "total_sus_score",                                                 precision: 10, scale: 1
    t.integer "review_id"
  end

  add_index "sus_scores", ["review_id"], name: "index_sus_scores_on_review_id", using: :btree

  create_table "system_suppliers", force: :cascade do |t|
    t.text     "supplier_name"
    t.text     "supplier_primary_phone"
    t.text     "supplier_email"
    t.text     "supplier_website_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "systems", force: :cascade do |t|
    t.text     "system_name"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "system_type"
    t.text     "system_main_web_url"
    t.text     "system_user_group_url"
    t.boolean  "system_sales_discontinued", default: false
    t.integer  "system_supplier_id"
  end

  add_index "systems", ["system_supplier_id"], name: "index_systems_on_system_supplier_id", using: :btree

  create_table "trust_systems", force: :cascade do |t|
    t.integer  "trust_id"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trust_systems", ["system_id"], name: "index_trust_systems_on_system_id", using: :btree
  add_index "trust_systems", ["trust_id"], name: "index_trust_systems_on_trust_id", using: :btree

  create_table "trusts", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "trust_number"
    t.text     "trust_legal_name"
    t.text     "trust_display_name"
    t.text     "trust_type"
    t.text     "trust_region"
    t.date     "trust_date_of_establishment"
    t.string   "trust_main_phone"
    t.text     "trust_hq_address_line_1"
    t.text     "trust_hq_address_line_2"
    t.text     "trust_hq_address_line_3"
    t.text     "trust_hq_address_line_4"
    t.text     "trust_postcode"
    t.text     "trust_country"
    t.text     "trust_website_url"
    t.text     "trust_email_pattern"
    t.text     "trust_nhs_code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.integer  "user_age"
    t.datetime "user_date_of_birth"
    t.integer  "trust_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "csus_scores", "reviews"
  add_foreign_key "hospitals", "trusts"
  add_foreign_key "reviews", "systems"
  add_foreign_key "reviews", "users"
  add_foreign_key "sus_scores", "reviews"
  add_foreign_key "systems", "system_suppliers"
  add_foreign_key "trust_systems", "systems"
  add_foreign_key "trust_systems", "trusts"
end
