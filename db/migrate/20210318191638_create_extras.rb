class CreateExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :extras do |t|
      t.references :persona, null: false, foreign_key: true
      t.text :descripcion

      t.timestamps
    end
  end
end
