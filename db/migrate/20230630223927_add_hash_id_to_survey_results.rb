class AddHashIdToSurveyResults < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_results, :hash_id, :string
  end
end
