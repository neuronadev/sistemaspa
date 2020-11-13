class CreatePatentes < ActiveRecord::Migration[6.0]
  def change
    create_table :patentes do |t|
      t.references :tipopatente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
