class ChangeSizeInputToInteger < ActiveRecord::Migration[7.0]
  def up
    remove_column :surveys, :size_input
    add_column :surveys, :size_input, :integer
  end

  def down
    remove_column :surveys, :size_input
    add_column :surveys, :size_input, :string
  end
end
