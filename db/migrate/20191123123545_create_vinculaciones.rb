class CreateVinculaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :vinculaciones do |t|
      t.string :tipovinculacion, limit: 2
      t.string :niveldecreto, limit: 1
      t.string :ordenamiento, limit: 1
      t.string :niveliniciativa, limit: 1
      t.string :nivelregla, limit: 1
      t.string :nivelcomite, limit: 1
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
