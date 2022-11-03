class CreateEvaltecnicos < ActiveRecord::Migration[6.0]
  def change
    create_table :'mru.evaltecnicos' do |t|
      t.references :persona, null: false, foreign_key: true
      t.integer :anio

      t.timestamps
    end
  end
end
