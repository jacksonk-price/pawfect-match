class RemoveDogBreedIdFromSurveyResults < ActiveRecord::Migration[7.0]
  def change
    remove_column :survey_results, :dog_breed_id
  end
end
