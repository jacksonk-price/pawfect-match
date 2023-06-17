require 'rails_helper'

RSpec.describe Dog, type: :model do
  let!(:small_dog) { Dog.create(name: 'Affenpinscher', min_weight: 10, max_weight: 15) }
  let!(:medium_dog) { Dog.create(name: 'Yorkshire Terrier', min_weight: 25, max_weight: 35) }
  let!(:large_dog) { Dog.create(name: 'Treeing Tennessee Brindle', min_weight: 85, max_weight: 112) }
  let!(:very_large_dog) { Dog.create(name: 'Slovakian Wirehaired Pointer', min_weight: 115, max_weight: 245) }

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

  describe '#average_weight' do
    context 'when calculating the average weight' do
      it 'returns the average weight of a small dog' do
        small_dog_average = small_dog.average_weight
        expect(small_dog_average).to eq(12)
      end

      it 'returns the average weight of a medium dog' do
        medium_dog_average = medium_dog.average_weight
        expect(medium_dog_average).to eq(30)
      end

      it 'returns the average weight of a large dog' do
        large_dog_average = large_dog.average_weight
        expect(large_dog_average).to eq(98)
      end

      it 'returns the average weight of a very large dog' do
        very_large_dog_average = very_large_dog.average_weight
        expect(very_large_dog_average).to eq(180)
      end
    end
  end

  describe '#akc_url' do
    it "returns the url to the dog's profile on the American Kennel Club website" do
      expect(small_dog.akc_url).to eq('https://www.akc.org/dog-breeds/affenpinscher')
      expect(medium_dog.akc_url).to eq('https://www.akc.org/dog-breeds/yorkshire-terrier')
      expect(large_dog.akc_url).to eq('https://www.akc.org/dog-breeds/treeing-tennessee-brindle')
      expect(very_large_dog.akc_url).to eq('https://www.akc.org/dog-breeds/slovakian-wirehaired-pointer')
    end
  end
end
