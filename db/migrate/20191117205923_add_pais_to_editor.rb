class AddPaisToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :pais, :string
  end
end
