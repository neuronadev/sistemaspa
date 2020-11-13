class RemoveEmpleadoFromHistorico < ActiveRecord::Migration[6.0]
  def change

    remove_column :historicos, :empleado, :integer
  end
end
