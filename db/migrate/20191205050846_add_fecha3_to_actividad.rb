class AddFecha3ToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :fecha3, :date
  end
end
