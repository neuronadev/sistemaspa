class CreateActividades < ActiveRecord::Migration[6.0]
  def change
    create_table :actividades do |t|
      t.integer :folio
      t.string :titulo
      t.integer :anio
      t.string :fuente, limit: 2
      t.integer :idfnet
      t.string :tipo, limit: 2
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
