class SuggestedBreed < ApplicationRecord
  belongs_to :dog
  belongs_to :survey_result
end
