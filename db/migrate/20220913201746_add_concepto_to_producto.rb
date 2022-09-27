class AddConceptoToProducto < ActiveRecord::Migration[6.0]
  def change
    add_column :productos, :concepto, :string
  end
end
