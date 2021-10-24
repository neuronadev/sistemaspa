class AddPathfToProducto < ActiveRecord::Migration[6.0]
  def change
    add_column :productos, :pathf, :string
  end
end
