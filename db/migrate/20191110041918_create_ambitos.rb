class CreateAmbitos < ActiveRecord::Migration[6.0]
  def change
    create_table :ambitos do |t|
      t.string :nomambito, limit: 85

      t.timestamps
    end
  end
end
