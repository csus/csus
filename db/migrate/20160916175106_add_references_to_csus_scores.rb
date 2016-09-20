class AddReferencesToCsusScores < ActiveRecord::Migration
  def change
    add_reference :csus_scores, :review, index: true, foreign_key: true
  end
end
