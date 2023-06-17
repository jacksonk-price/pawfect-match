class Dog < ApplicationRecord
  has_many :suggested_breeds

  scope :any_size, -> { where('min_weight > 0 AND max_weight < 250') }
  scope :small, -> { where("max_weight < 22") }
  scope :medium, -> { where('min_weight > 22 AND max_weight < 55') }
  scope :large, -> { where('min_weight > 55 AND max_weight < 115') }
  scope :very_large, -> { where('max_weight > 115') }

  def average_weight
    (min_weight + max_weight) / 2
  end

  def akc_url
    "https://www.akc.org/dog-breeds/#{formatted_name}"
  end

  private

  def formatted_name
    name.unicode_normalize(:nfkd).encode('ASCII', replace: '').downcase.gsub(' ','-')
  end
end
