class AddMedioToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :medio, :string
  end
end
