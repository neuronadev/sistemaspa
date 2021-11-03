class CreateValetapas < ActiveRecord::Migration[6.0]
  def change
    create_table :valetapas do |t|
      t.references :actividad, null: false, foreign_key: true
      t.references :persona, null: false, foreign_key: true
      t.string :etapa
      t.string :accion
      t.string :estado
      t.string :atendido
      t.string :activo

      t.timestamps
    end
  end
end
