class SurveyResult < ApplicationRecord
  belongs_to :survey
  has_many :suggested_breeds
  has_many :dogs, through: :suggested_breeds
end
