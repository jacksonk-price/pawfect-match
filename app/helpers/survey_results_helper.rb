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
      '<i class="fa-solid fa-bone bone gray-bone"></i>'
    else
      '<i class="fa-solid fa-bone bone blue-bone"></i>'
    end
  end

  def display_class(index)
    'hidden' unless index == 0
  end
end
