class AddProductoToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :producto, :string
  end
end
