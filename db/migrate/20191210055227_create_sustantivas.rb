class CreateSustantivas < ActiveRecord::Migration[6.0]
  def change
    create_table :sustantivas do |t|
      t.integer :anio
      t.integer :investigadorid
      t.text :descripcion
      t.decimal :porcentaje, precision: 5, scale: 2
      t.references :academico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
