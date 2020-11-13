class CreateHistoricos < ActiveRecord::Migration[6.0]
  def change
    create_table :historicos do |t|
      t.integer :empleado
      t.string :folio
      t.string :producto
      t.string :titulo
      t.string :autores
      t.string :comprobante

      t.timestamps
    end
  end
end
