class AddSlugToSurveyResults < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_results, :slug, :string
    add_index :survey_results, :slug, unique: true
  end
end
