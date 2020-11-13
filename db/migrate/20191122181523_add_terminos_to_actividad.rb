class AddTerminosToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :terminos, :boolean
  end
end
