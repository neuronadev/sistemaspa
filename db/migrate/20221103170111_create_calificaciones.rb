class CreateCalificaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :'mru.calificaciones' do |t|
      t.references :itemsustantiva, null: false, foreign_key: true
      t.decimal :calificacion, precision: 16, scale: 2
      t.text :quiz
      t.string :tipo, limit: 2
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
