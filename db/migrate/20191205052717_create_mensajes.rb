class CreateMensajes < ActiveRecord::Migration[6.0]
  def change
    create_table :mensajes do |t|
      t.references :actividad, null: false, foreign_key: true
      t.references :persona, null: false, foreign_key: true
      t.string :tipo, limit: 1
      t.string :estado, limit: 1
      t.text :txt

      t.timestamps
    end
  end
end
