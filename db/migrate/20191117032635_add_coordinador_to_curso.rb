class AddCoordinadorToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :coordinador, :boolean
  end
end
