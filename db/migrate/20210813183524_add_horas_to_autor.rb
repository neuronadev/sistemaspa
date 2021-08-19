class AddHorasToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :horas, :decimal, precision: 16, scale: 2
  end
end
