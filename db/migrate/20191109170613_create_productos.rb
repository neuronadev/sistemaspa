class CreateProductos < ActiveRecord::Migration[6.0]
  def change
    create_table :productos do |t|
      t.string :descripcion
      t.string :descripcioncorta
      t.integer :puntaje
      t.references :prodcategoria, null: false, foreign_key: true
      t.references :prodgrupo, null: false, foreign_key: true
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
