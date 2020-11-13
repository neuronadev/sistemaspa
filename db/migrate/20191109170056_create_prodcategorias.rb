class CreateProdcategorias < ActiveRecord::Migration[6.0]
  def change
    create_table :prodcategorias do |t|
      t.string :nomcategoria
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
