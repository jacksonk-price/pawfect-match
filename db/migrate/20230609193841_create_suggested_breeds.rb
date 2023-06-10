class CreateSuggestedBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :suggested_breeds do |t|
      t.integer :dog_id
      t.references :survey_result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
