class CreateEvaluaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluaciones do |t|
      t.references :persona, null: false, foreign_key: true
      t.date :fecha
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
