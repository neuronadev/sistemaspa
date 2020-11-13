class AddReferenciaidToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :referenciaid, :integer
  end
end
