class AddKateToArticulo < ActiveRecord::Migration[6.0]
  def change
    add_column :articulos, :kate, :integer
  end
end
