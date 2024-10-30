class CreateCalsustantivas < ActiveRecord::Migration[6.0]
  def change
    create_table :calsustantivas do |t|
      t.references :actsustantiva, null: false, foreign_key: true
      t.references :tcalificacion, null: false, foreign_key: true
      t.decimal :calificacion, precision: 16, scale: 2
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
