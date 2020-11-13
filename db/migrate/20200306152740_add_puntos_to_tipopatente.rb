class AddPuntosToTipopatente < ActiveRecord::Migration[6.0]
  def change
    add_column :tipopatentes, :puntos, :integer
  end
end
