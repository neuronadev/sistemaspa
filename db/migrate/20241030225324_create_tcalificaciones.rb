class CreateTcalificaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :tcalificaciones do |t|
      t.string :descripcion
      t.string :clave, limit: 3

      t.timestamps
    end
  end
end
