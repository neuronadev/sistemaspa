class AddReferenciaidToRevista < ActiveRecord::Migration[6.0]
  def change
    add_column :revistas, :referenciaid, :integer
  end
end
