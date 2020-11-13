class AddProductoToActividad < ActiveRecord::Migration[6.0]
  def change
    add_reference :actividades, :producto, null: false, foreign_key: true
  end
end
