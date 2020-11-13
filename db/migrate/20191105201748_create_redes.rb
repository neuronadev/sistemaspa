class CreateRedes < ActiveRecord::Migration[6.0]
  def change
    create_table :redes do |t|
      t.string :nomred
      t.string :clavered, limit: 15

      t.timestamps
    end
  end
end
