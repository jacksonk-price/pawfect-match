class SurveyResultsController < ApplicationController
  def show
    @survey_result = SurveyResult.find params[:id]
    @survey = Survey.find @survey_result.survey_id
    @suggested_dog_breeds = @survey_result.dogs
  end
end
