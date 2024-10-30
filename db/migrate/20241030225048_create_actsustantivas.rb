class CreateActsustantivas < ActiveRecord::Migration[6.0]
  def change
    create_table :actsustantivas do |t|
      t.integer :acad_tecnico
      t.integer :acad_jefe
      t.text :actividad
      t.decimal :porcentaje, precision: 16, scale: 2
      t.integer :anio
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
