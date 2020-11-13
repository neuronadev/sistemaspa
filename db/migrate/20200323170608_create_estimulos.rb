class CreateEstimulos < ActiveRecord::Migration[6.0]
  def change
    create_table :estimulos do |t|
      t.references :persona, null: false, foreign_key: true
      t.string :monto

      t.timestamps
    end
  end
end
