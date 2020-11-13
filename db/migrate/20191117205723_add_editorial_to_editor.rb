class AddEditorialToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :editorial, :string
  end
end
