class CreateCapitulos < ActiveRecord::Migration[6.0]
  def change
    create_table :capitulos do |t|
      t.integer :pgini
      t.integer :pgfin
      t.references :idioma, null: false, foreign_key: true
      t.references :libro, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
