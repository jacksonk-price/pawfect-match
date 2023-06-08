require 'rails_helper'
require 'survey_result_calculator'

RSpec.describe SurveyResultCalculator do
  let!(:small_dog) { Dog.create(min_weight: 10, max_weight: 20) }
  let!(:another_small_dog) { Dog.create(min_weight: 7, max_weight: 16) }
  let!(:medium_dog) { Dog.create(min_weight: 25, max_weight: 30) }
  let!(:large_dog) { Dog.create(min_weight: 85, max_weight: 112) }
  let!(:very_large_dog) { Dog.create(min_weight: 115, max_weight: 245) }
  let!(:survey) { Survey.create(name_input: "John",
                             size_input: 2,
                             family_input: 1,
                             children_input: 1,
                             other_dog_input: 1,
                             shedding_input: 1,
                             grooming_input: 1,
                             drooling_input: 2,
                             stranger_input: 0,
                             playfulness_input: 2,
                             protective_input: 0,
                             adaptability_input: 3,
                             trainability_input: 3,
                             energy_input: 4,
                             barking_input: 3,
                             mental_stim_input: 2) }

  describe '.perform' do
    it 'returns the correct collection of dogs based on size' do
      result = SurveyResultCalculator.new(survey).perform
      expect(result).to include(small_dog, another_small_dog)
      expect(result).not_to include(medium_dog, large_dog, very_large_dog)
    end
  end
end