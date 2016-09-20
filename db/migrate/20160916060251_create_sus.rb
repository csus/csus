class CreateSus < ActiveRecord::Migration
  def change
    create_table :sus do |t|
      t.integer :i_would_like_to_use_this_system_frequently
      t.integer :the_system_is_unnecessarily_complex
      t.integer :the_system_is_easy_to_use
      t.integer :i_need_frequent_technical_support_to_use_this_system
      t.integer :the_various_functions_in_this_system_are_well_integrated
      t.integer :there_is_too_much_inconsistency_in_this_system
      t.integer :most_people_would_learn_to_use_this_system_very_quickly
      t.integer :the_system_was_very_cumbersome_to_use
      t.integer :i_feel_confident_using_this_system
      t.integer :i_needed_to_learn_a_lot_of_things_before_i_could_get_going_with_this_system
      t.decimal :total_sus_score, precision: 10, scale: 1
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
