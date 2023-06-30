class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @questions = Question.all.sort_by { |question| question.order }
  end

  def create
    @survey = Survey.new(survey_params)
    respond_to do |format|
      if @survey.save
        top_suggestions = SurveyResultCalculator.new(@survey).perform
        survey_result = SurveyResult.create(survey_id: @survey.id)
        top_suggestions.each do |suggestion|
          dog = suggestion[:breed]
          SuggestedBreed.create(dog_id: dog.id, survey_result_id: survey_result.id)
        end

        format.html { redirect_to survey_result_path(survey_result.slug), notice: "Survey was successfully created." }
      else
        Rails.logger.info @survey.errors.messages
      end
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:name_input, :size_input, :family_input, :children_input, :other_dog_input, :shedding_input, :grooming_input,
                                   :drooling_input, :stranger_input, :playfulness_input, :protective_input, :adaptability_input,
                                   :trainability_input, :energy_input, :barking_input, :mental_stim_input)
  end
end
