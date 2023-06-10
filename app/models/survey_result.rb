class SurveyResult < ApplicationRecord
  belongs_to :survey
  has_many :survey_result_suggested_breeds
end
