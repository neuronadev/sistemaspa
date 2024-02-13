class AddTipoToProducto < ActiveRecord::Migration[6.0]
  def change
    add_column :productos, :tipo, :string, limit: 100
  end
end
