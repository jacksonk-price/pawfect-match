class SurveyResultsController < ApplicationController
  def show
    @survey_result = SurveyResult.find params[:id]
    @suggested_dog_breed = Dog.find @survey_result.dog_breed_id
  end
end
