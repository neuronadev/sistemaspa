class AddCategoriaToAcademico < ActiveRecord::Migration[6.0]
  def change
    add_reference :academicos, :categoria, null: false, foreign_key: true
  end
end
