class CreateTipocapitulos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipocapitulos do |t|
      t.string :nomtipo

      t.timestamps
    end
  end
end
