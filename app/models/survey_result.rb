class SurveyResult < ApplicationRecord
  extend FriendlyId
  friendly_id :hash_id, use: :slugged

  before_save :set_hash_id, prepend: true
  belongs_to :survey
  has_many :suggested_breeds
  has_many :dogs, through: :suggested_breeds

  private

  def set_hash_id
    self.hash_id = SecureRandom.urlsafe_base64(8)
  end
end
