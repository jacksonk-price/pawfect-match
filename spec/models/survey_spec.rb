require 'rails_helper'

RSpec.describe Survey, type: :model do
  it 'has a name input' do
    survey = Survey.new(name_input: '',
                        size_input: 5, family_input: 5,
                        children_input: 5, other_dog_input: 5,
                        shedding_input: 5, grooming_input: 5,
                        drooling_input: 5, stranger_input: 5,
                        playfulness_input: 5, protective_input: 5,
                        adaptability_input: 5, trainability_input: 5,
                        energy_input: 5, barking_input: 5, mental_stim_input: 5)
    expect(survey).to_not be_valid
    survey.name_input = 'Jackson'
    expect(survey).to be_valid
  end

  it 'has numerical inputs between 0 and 5' do
    attributes = %i[
      size_input family_input children_input other_dog_input shedding_input
      grooming_input drooling_input stranger_input playfulness_input protective_input
      adaptability_input trainability_input energy_input barking_input mental_stim_input
    ]

    survey = Survey.new(name_input: 'Jackson',
                        size_input: 5, family_input: 5,
                        children_input: 5, other_dog_input: 5,
                        shedding_input: 5, grooming_input: 5,
                        drooling_input: 5, stranger_input: 5,
                        playfulness_input: 5, protective_input: 5,
                        adaptability_input: 5, trainability_input: 5,
                        energy_input: 5, barking_input: 5, mental_stim_input: 5)

    attributes.each do |attribute|
      survey[attribute] = nil
      expect(survey).to_not be_valid

      survey[attribute] = -1
      expect(survey).to_not be_valid

      survey[attribute] = 6
      expect(survey).to_not be_valid

      survey[attribute] = 3
      expect(survey).to be_valid
    end
  end
end
