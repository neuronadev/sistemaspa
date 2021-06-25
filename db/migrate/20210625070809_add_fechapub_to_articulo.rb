class AddFechapubToArticulo < ActiveRecord::Migration[6.0]
  def change
    add_column :articulos, :fechapub, :date
  end
end
