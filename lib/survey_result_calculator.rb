class SurveyResultCalculator
  attr_reader :survey

  def initialize(survey)
    @survey = survey
  end

  def perform
    dog_breeds = filter_size
  end

  private

  def filter_size
    size_options = { 1 => :any, 2 => :small, 3 => :medium, 4 => :large, 5 => :very_large }
    selected_size = size_options[@survey.size_input]

    Dog.public_send(selected_size)
  end
end