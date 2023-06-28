class RemoveDescriptionFieldFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :description
  end
end
