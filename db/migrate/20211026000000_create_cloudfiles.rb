class CreateCloudfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :'cloud.cloudfiles' do |t|
      t.text :descripcion
      t.text :hashlink
      t.integer :periodo
      t.string :estado

      t.timestamps
    end
  end
end
