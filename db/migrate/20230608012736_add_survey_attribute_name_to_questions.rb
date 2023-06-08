class AddSurveyAttributeNameToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :survey_attribute_name, :string
  end
end
