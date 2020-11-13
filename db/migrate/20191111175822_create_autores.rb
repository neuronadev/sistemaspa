class CreateAutores < ActiveRecord::Migration[6.0]
  def change
    create_table :autores do |t|
      t.string :firma
      t.references :rol, null: false, foreign_key: true
      t.integer :posicion
      t.string :corresponsal, limit: 1
      t.string :reporta, limit: 1
      t.string :tipoautor, limit: 1
      t.string :filiacion
      t.references :persona, null: false, foreign_key: true

      t.timestamps
    end
  end
end
