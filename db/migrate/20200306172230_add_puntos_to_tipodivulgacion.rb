class AddPuntosToTipodivulgacion < ActiveRecord::Migration[6.0]
  def change
    add_column :tipodivulgaciones, :puntos, :integer
  end
end
