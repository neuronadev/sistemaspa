class CreateTipomedios < ActiveRecord::Migration[6.0]
  def change
    create_table :tipomedios do |t|
      t.string :nomtipomedio

      t.timestamps
    end
  end
end
