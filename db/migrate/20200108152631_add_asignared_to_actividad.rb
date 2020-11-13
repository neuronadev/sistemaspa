class AddAsignaredToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :asignared, :integer
  end
end
