class SurveyResultCalculator
  attr_reader :survey

  def initialize(survey)
    @survey = survey
  end

  def perform
    dog_breeds = filter_size
    dog_breeds = filter_yes_and_no_questions(dog_breeds)

    get_breed_suggestion(dog_breeds)
  end

  private

  def filter_size
    size_options = { 1 => :any_size, 2 => :small, 3 => :medium, 4 => :large, 5 => :very_large }
    selected_size = size_options[@survey.size_input]

    Dog.public_send(selected_size)
  end

  def filter_family(dog_breeds)
    @survey.family_input == 1 ? dog_breeds.where('family_score >= 3') : dog_breeds
  end

  def filter_yes_and_no_questions(dog_breeds)
    dog_breeds = filter_family(dog_breeds)
    dog_breeds = filter_children(dog_breeds)
    dog_breeds = filter_other_dog(dog_breeds)
    dog_breeds = filter_stranger(dog_breeds)

    filter_protective(dog_breeds)
  end

  def filter_children(dog_breeds)
    @survey.children_input == 1 ? dog_breeds.where('children_score >= 3') : dog_breeds
  end

  def filter_other_dog(dog_breeds)
    @survey.other_dog_input == 1 ? dog_breeds.where('children_score >= 3') : dog_breeds
  end

  def filter_stranger(dog_breeds)
    @survey.stranger_input == 1 ? dog_breeds.where('stranger_score >= 3') : dog_breeds
  end

  def filter_protective(dog_breeds)
    @survey.protective_input == 1 ? dog_breeds.where('protective_score >= 3') : dog_breeds
  end

  def get_breed_suggestion(dog_breeds)
    suggested_breeds = dog_breeds.map do |dog_breed|
      total_distance = find_total_distance(dog_breed)

      { breed: dog_breed, distance: total_distance }
    end

    suggested_breeds.sort_by { |d| d[:distance] }.first
  end

  def find_total_distance(dog_breed)
    distances = [
      (dog_breed.shedding_score - @survey.shedding_input).abs,
      (dog_breed.grooming_score - @survey.grooming_input).abs,
      (dog_breed.drooling_score - @survey.drooling_input).abs,
      (dog_breed.playfulness_score - @survey.playfulness_input).abs,
      (dog_breed.adaptability_score - @survey.adaptability_input).abs,
      (dog_breed.trainability_score - @survey.trainability_input).abs,
      (dog_breed.energy_score - @survey.energy_input).abs,
      (dog_breed.barking_score - @survey.barking_input).abs,
      (dog_breed.mental_stim_score - @survey.mental_stim_input).abs
    ]

    Math.sqrt(distances.sum { |d| d**2 })
  end
end