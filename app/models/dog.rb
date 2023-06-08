class Dog < ApplicationRecord
  scope :any_size, -> { where('min_weight > 0 AND max_weight < 250') }
  scope :small, -> { where("max_weight < 22") }
  scope :medium, -> { where('min_weight > 22 AND max_weight < 55') }
  scope :large, -> { where('min_weight > 55 AND max_weight < 115') }
  scope :very_large, -> { where('max_weight > 115') }
end
