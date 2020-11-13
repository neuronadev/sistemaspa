class AddPuntosToTipofasciculo < ActiveRecord::Migration[6.0]
  def change
    add_column :tipofasciculos, :puntos, :integer
  end
end
