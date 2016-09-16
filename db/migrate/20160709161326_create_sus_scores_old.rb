class CreateSusScores < ActiveRecord::Migration
  def change
    create_table :sus_scores do |t|
      t.string :reduces_the_risk_of_clinical_error
      t.string :support_is_hard_to_access
      t.string :improves_quality_clinical_care
      t.string :consultation_adversely_affected
      t.string :gives_me_key_information_needed
      t.integer :total_csus_score
      t.timestamps null: false
    end
    add_reference :sus_scores, :review, index: true
  end
end
