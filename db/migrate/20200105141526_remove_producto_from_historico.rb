class RemoveProductoFromHistorico < ActiveRecord::Migration[6.0]
  def change

    remove_column :historicos, :producto, :string
  end
end
