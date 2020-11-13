class AddMontoToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :monto, :decimal, precision: 12, scale: 2
  end
end
