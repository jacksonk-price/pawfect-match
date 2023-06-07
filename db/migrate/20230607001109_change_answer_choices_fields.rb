class ChangeAnswerChoicesFields < ActiveRecord::Migration[7.0]
  def change
    rename_column :answer_choices, :content, :text
    add_column :answer_choices, :value, :integer
  end
end
