class CreateLibroarbitrados < ActiveRecord::Migration[6.0]
  def change
    create_table :libroarbitrados do |t|
      t.integer :nopaginas
      t.references :idioma, null: false, foreign_key: true
      t.references :editorial, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
