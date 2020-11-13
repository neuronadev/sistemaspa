class CreateEditoriales < ActiveRecord::Migration[6.0]
  def change
    create_table :editoriales do |t|
      t.string :nomeditorial
      t.string :especializada, limit: 2
      t.string :ciudad, limit: 85
      t.string :estado, limit: 1
      t.references :pais, null: false, foreign_key: true
      t.references :ambito, null: false, foreign_key: true

      t.timestamps
    end
  end
end
