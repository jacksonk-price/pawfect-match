require 'rails_helper'

RSpec.describe Dog, type: :model do
  let!(:small_dog) { Dog.create(min_weight: 10, max_weight: 15) }
  let!(:medium_dog) { Dog.create(min_weight: 25, max_weight: 35) }
  let!(:large_dog) { Dog.create(min_weight: 85, max_weight: 112) }
  let!(:very_large_dog) { Dog.create(min_weight: 115, max_weight: 245) }

  after(:each) do
    Dog.delete_all
  end

  describe '.any_size' do
    it 'returns dogs of any size' do
      result = Dog.any_size
      expect(result).to include(small_dog, medium_dog, large_dog, very_large_dog)
    end
  end

  describe '.small' do
    it 'returns small dogs' do
      result = Dog.small
      expect(result).to include(small_dog)
      expect(result).not_to include(medium_dog, large_dog, very_large_dog)
    end
  end

  describe '.medium' do
    it 'returns medium dogs' do
      result = Dog.medium
      expect(result).to include(medium_dog)
      expect(result).not_to include(small_dog, large_dog, very_large_dog)
    end
  end

  describe '.medium' do
    it 'returns medium dogs' do
      result = Dog.medium
      expect(result).to include(medium_dog)
      expect(result).not_to include(small_dog, large_dog, very_large_dog)
    end
  end

  describe '.large' do
    it 'returns large dogs' do
      result = Dog.large
      expect(result).to include(large_dog)
      expect(result).not_to include(small_dog, medium_dog, very_large_dog)
    end
  end

  describe '.very_large' do
    it 'returns very large dogs' do
      result = Dog.very_large
      expect(result).to include(very_large_dog)
      expect(result).not_to include(small_dog, medium_dog, large_dog)
    end
  end
end
