class CreateComvalidaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :'val.comvalidaciones' do |t|
      t.references :comite, null: false, foreign_key: true
      t.references :academico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
