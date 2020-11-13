class CreateCalprevios < ActiveRecord::Migration[6.0]
  def change
    create_table :calprevios do |t|
      t.integer :idpersona
      t.string :tipoprod, limit: 15
      t.integer :anio
      t.string :fuente, limit: 15
      t.integer :idfuente
      t.integer :nopart
      t.integer :noparts
      t.string :equivalencia, limit: 2
      t.string :numeral, limit: 25
      t.string :tipopersona, limit: 1
      t.string :estimulo, limit: 2

      t.timestamps
    end
  end
end
