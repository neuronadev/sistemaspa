class CreateProdgrupos < ActiveRecord::Migration[6.0]
  def change
    create_table :prodgrupos do |t|
      t.string :nomgrupo
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
