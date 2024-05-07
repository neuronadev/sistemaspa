class AddEstudianteToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :estudiante, :boolean
  end
end
