class AddPmtToPresupuesto < ActiveRecord::Migration[6.0]
  def change
    add_column :presupuestos, :pmt, :string
  end
end
