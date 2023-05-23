class CreatePuntos < ActiveRecord::Migration[6.0]
  def change
    create_table :puntos do |t|
      t.integer :persona_id
      t.integer :actividad_id
      t.decimal :ptprod, precision: 16, scale: 2
      t.decimal :porcentaje, precision: 16, scale: 2
      t.decimal :pt, precision: 16, scale: 2
      t.text :comentarios

      t.timestamps
    end
  end
end
