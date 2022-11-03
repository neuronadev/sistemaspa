class CreateItemsustantivas < ActiveRecord::Migration[6.0]
  def change
    create_table :'mru.itemsustantivas' do |t|
      t.references :evaltecnico, null: false, foreign_key: true
      t.references :persona, null: false, foreign_key: true
      t.text :descripcion
      t.decimal :porcentaje, precision: 16, scale: 2

      t.timestamps
    end
  end
end
