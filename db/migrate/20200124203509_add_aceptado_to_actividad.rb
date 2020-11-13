class AddAceptadoToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :aceptado, :string, limit: 1
  end
end
