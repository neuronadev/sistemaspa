class AddCoordinadorToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :coordinador, :boolean
  end
end
