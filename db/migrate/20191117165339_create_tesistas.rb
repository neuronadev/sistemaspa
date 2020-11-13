class CreateTesistas < ActiveRecord::Migration[6.0]
  def change
    create_table :tesistas do |t|
      t.date :ftermino
      t.references :nivelestudio, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
