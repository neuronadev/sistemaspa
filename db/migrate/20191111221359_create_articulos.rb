class CreateArticulos < ActiveRecord::Migration[6.0]
  def change
    create_table :articulos do |t|
      t.string :volumen
      t.string :doi
      t.string :issue
      t.string :pgini
      t.string :pgfin
      t.references :revista, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
