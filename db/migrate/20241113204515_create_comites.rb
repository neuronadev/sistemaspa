class CreateComites < ActiveRecord::Migration[6.0]
  def change
    create_table :'val.comites' do |t|
      t.references :academico, null: false, foreign_key: true
      t.references :catevaluador, null: false, foreign_key: true
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
