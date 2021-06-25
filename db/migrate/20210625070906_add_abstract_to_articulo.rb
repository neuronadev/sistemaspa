class AddAbstractToArticulo < ActiveRecord::Migration[6.0]
  def change
    add_column :articulos, :abstract, :text
  end
end
