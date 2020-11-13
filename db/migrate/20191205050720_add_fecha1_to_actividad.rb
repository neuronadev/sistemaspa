class AddFecha1ToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :fecha1, :date
  end
end
