class CreateTipofasciculos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipofasciculos do |t|
      t.string :nomtipofasciculo

      t.timestamps
    end
  end
end
