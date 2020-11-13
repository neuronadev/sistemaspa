class CreateTipopatentes < ActiveRecord::Migration[6.0]
  def change
    create_table :tipopatentes do |t|
      t.string :nomtipopatente
      t.string :clave, limit: 3

      t.timestamps
    end
  end
end
