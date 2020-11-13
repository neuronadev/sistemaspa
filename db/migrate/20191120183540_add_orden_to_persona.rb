class AddOrdenToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :orden, :integer
  end
end
