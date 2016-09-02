class CreateTrustSystems < ActiveRecord::Migration
  def change
    create_table :trust_systems do |t|
      t.references :trust, index: true, foreign_key: true
      t.references :system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
