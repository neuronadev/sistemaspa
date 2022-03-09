class CreateTipolibros < ActiveRecord::Migration[6.0]
  def change
    create_table :tipolibros do |t|
      t.string :nomtipo

      t.timestamps
    end
  end
end
