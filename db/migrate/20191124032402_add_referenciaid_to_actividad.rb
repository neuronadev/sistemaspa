class AddReferenciaidToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :referenciaid, :integer
  end
end
