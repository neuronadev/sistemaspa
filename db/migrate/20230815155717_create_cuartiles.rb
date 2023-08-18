class CreateCuartiles < ActiveRecord::Migration[6.0]
  def change
    create_table :cuartiles do |t|
      t.references :revista, null: false, foreign_key: true
      t.integer :periodo
      t.string :cuartil

      t.timestamps
    end
  end
end
