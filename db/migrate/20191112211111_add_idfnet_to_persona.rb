class AddIdfnetToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :idfnet, :integer
  end
end
