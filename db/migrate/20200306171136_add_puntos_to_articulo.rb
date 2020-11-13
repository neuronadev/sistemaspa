class AddPuntosToArticulo < ActiveRecord::Migration[6.0]
  def change
    add_column :articulos, :puntos, :integer
  end
end
