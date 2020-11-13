class CreateDivulgaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :divulgaciones do |t|
      t.integer :noparticipantes
      t.integer :nodias
      t.references :tipodivulgacion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
