class ChangeSizeInputOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :surveys, :size_input, :integer, after: :name_input
  end
end
