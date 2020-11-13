class AddPeriodoToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :periodo, :integer
  end
end
