class CreateTipodivulgaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :tipodivulgaciones do |t|
      t.string :nomtipodivulgacion

      t.timestamps
    end
  end
end
