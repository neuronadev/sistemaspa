class CreateFasciculos < ActiveRecord::Migration[6.0]
  def change
    create_table :fasciculos do |t|
      t.references :tipofasciculo, null: false, foreign_key: true
      t.references :tipomedio, null: false, foreign_key: true
      t.string :nommedio
      t.string :codigo
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
