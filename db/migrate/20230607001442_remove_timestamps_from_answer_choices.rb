class RemoveTimestampsFromAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    remove_timestamps :answer_choices
  end
end
