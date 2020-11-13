class CreateTipopersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :tipopersonas do |t|
      t.string :nomtipopersona, limit: 25

      t.timestamps
    end
  end
end
