class AddTipocapituloToCapitulo < ActiveRecord::Migration[6.0]
  def change
    add_column :capitulos, :tipocapitulo_id, :integer
  end
end
