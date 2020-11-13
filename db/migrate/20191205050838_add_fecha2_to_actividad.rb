class AddFecha2ToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :fecha2, :date
  end
end
