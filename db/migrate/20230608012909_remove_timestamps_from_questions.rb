class RemoveTimestampsFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_timestamps :questions
  end
end
