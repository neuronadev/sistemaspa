class AddActividadToAutor < ActiveRecord::Migration[6.0]
  def change
    add_reference :autores, :actividad, null: false, foreign_key: true
  end
end
