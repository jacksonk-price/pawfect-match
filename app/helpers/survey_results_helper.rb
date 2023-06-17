module SurveyResultsHelper
  def top_three_wording(index)
    if index == 0
      'Top match'
    elsif index == 1
      'Second best match'
    else
      'Third best match'
    end
  end

  def display_score(score, index)
    if score < index
      '<i class="fa-solid fa-paw fa-2x gray-paw"></i>'
    else
      '<i class="fa-solid fa-paw fa-2x blue-paw"></i>'
    end
  end
end
