class CreateAcademicos < ActiveRecord::Migration[6.0]
  def change
    create_table :academicos do |t|
      t.integer :noempleado
      t.date :fingreso
      t.string :categoria, limit: 10
      t.string :tipocontrato, limit: 20
      t.date :fbaja
      t.string :nivelacad, limit: 6
      t.string :tipoinst, limit: 2
      t.string :estatus, limit: 2
      t.string :firma, limit: 50
      t.references :persona, null: false, foreign_key: true

      t.timestamps
    end
  end
end
