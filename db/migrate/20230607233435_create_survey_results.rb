class CreateSurveyResults < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_results do |t|
      t.integer :dog_breed_id
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
