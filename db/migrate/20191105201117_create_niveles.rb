class CreateNiveles < ActiveRecord::Migration[6.0]
  def change
    create_table :niveles do |t|
      t.string :nomnivel
      t.string :clavenivel, limit: 10

      t.timestamps
    end
  end
end
