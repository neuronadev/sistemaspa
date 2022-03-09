class CreateTdivulgaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :tdivulgaciones do |t|
      t.string :nomtipo

      t.timestamps
    end
  end
end
