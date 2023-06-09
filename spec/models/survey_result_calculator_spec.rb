require 'rails_helper'

RSpec.describe SurveyResultCalculator do
  let!(:survey1) { Survey.new(name_input: "test",
    family_input: 0,
    children_input: 0,
    other_dog_input: 0,
    shedding_input: 2,
    grooming_input: 2,
    drooling_input: 1,
    stranger_input: 0,
    playfulness_input: 2,
    protective_input: 0,
    adaptability_input: 2,
    trainability_input: 2,
    energy_input: 2,
    barking_input: 2,
    mental_stim_input: 3,
    size_input: 2) }

  let!(:dog1) { Dog.create( name: "Japanese Chin",
                           description:
                             "The Japanese Chin is a charming toy companion of silky, profuse coat and an unmistakably aristocratic bearing. Often described as a distinctly feline breed, this bright and amusing lapdog is fastidious, graceful, and generally quiet. Chin are the unrivaled noblemen of Japanese breeds. Theyre tiny indoorsy companions, with an unmistakably Eastern look and bearing. The head is large, the muzzle short, and the round, dark eyes convey, as Chin fans like to say, a look of astonishment. The profuse mane around the neck and shoulders, the plumed tail arching over the back, and the pants or culottes on the hind legs project the elegant, exotic appearance so typical of Asias royal line of laptop cuddle bugs.",
                           min_weight: 7,
                           max_weight: 11,
                           family_score: 5,
                           children_score: 3,
                           other_dog_score: 5,
                           shedding_score: 3,
                           grooming_score: 2,
                           drooling_score: 1,
                           stranger_score: 3,
                           playfulness_score: 3,
                           protective_score: 3,
                           adaptability_score: 4,
                           trainability_score: 3,
                           energy_score: 3,
                           barking_score: 2,
                           mental_stim_score: 3) }

  after(:each) do
    Dog.delete_all
    Survey.delete_all
  end

  describe '.perform' do
    it 'returns the correct suggested breed' do
      result = SurveyResultCalculator.new(survey1).perform
      suggested_breed = result[:breed]
      expect(suggested_breed).to eq(dog1)
    end
  end
end