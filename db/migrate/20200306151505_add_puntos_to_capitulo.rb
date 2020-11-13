class AddPuntosToCapitulo < ActiveRecord::Migration[6.0]
  def change
    add_column :capitulos, :puntos, :integer
  end
end
