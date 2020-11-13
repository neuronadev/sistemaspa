class AddEidentificadorToArticulo < ActiveRecord::Migration[6.0]
  def change
    add_column :articulos, :eidentificador, :string
  end
end
