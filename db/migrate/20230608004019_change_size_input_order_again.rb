class ChangeSizeInputOrderAgain < ActiveRecord::Migration[7.0]
  def up
    change_column :surveys, :size_input, :integer, after: :name_input
  end

  def down
    change_column :surveys, :size_input, :integer
  end
end
