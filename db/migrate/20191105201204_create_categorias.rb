class CreateCategorias < ActiveRecord::Migration[6.0]
  def change
    create_table :categorias do |t|
      t.string :nomcategoria
      t.string :clavecategoria, limit: 10

      t.timestamps
    end
  end
end
