class CreateTipoautores < ActiveRecord::Migration[6.0]
  def change
    create_table :tipoautores do |t|
      t.string :nomtipoautor
      t.string :clave

      t.timestamps
    end
  end
end
