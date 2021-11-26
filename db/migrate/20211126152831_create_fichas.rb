class CreateFichas < ActiveRecord::Migration[6.0]
  def change
    create_table :fichas do |t|
      t.string :nommedio
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
