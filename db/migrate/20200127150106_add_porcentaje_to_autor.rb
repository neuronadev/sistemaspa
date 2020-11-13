class AddPorcentajeToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :porcentaje, :decimal, precision: 7, scale: 2
  end
end
