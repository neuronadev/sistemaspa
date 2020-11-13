class CreateRevistas < ActiveRecord::Migration[6.0]
  def change
    create_table :revistas do |t|
      t.string :nomrevista
      t.string :cuartil, limit: 3
      t.decimal :factor, precision: 7, scale: 2
      t.string :estado, limit: 1
      t.string :issn
      t.string :eissn
      t.references :editorial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
