class CreateEvaluadores < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluadores do |t|
      t.integer :evaluadorid
      t.integer :evaluadoid
      t.string :tipo, limit: 1

      t.timestamps
    end
  end
end
