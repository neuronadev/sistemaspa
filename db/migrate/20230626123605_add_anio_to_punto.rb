class AddAnioToPunto < ActiveRecord::Migration[6.0]
  def change
    add_column :puntos, :anio, :integer
  end
end
