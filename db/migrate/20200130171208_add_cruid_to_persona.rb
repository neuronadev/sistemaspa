class AddCruidToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :cruid, :integer
  end
end
