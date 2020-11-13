class AddFaceptadoToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :faceptado, :date
  end
end
