class CreateLibros < ActiveRecord::Migration[6.0]
  def change
    create_table :libros do |t|
      t.string :nomlibro
      t.string :editores
      t.string :isbn
      t.string :anio
      t.string :nopaginas
      t.references :editorial, null: false, foreign_key: true
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
