class AddNumeroToPresupuesto < ActiveRecord::Migration[6.0]
  def change
    add_column :presupuestos, :numero, :integer
  end
end
