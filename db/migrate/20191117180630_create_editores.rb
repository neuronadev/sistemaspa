class CreateEditores < ActiveRecord::Migration[6.0]
  def change
    create_table :editores do |t|
      t.references :tipoeditor, null: false, foreign_key: true
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
