class AddNoempleadoToPresupuesto < ActiveRecord::Migration[6.0]
  def change
    add_column :presupuestos, :noempleado, :integer
  end
end
