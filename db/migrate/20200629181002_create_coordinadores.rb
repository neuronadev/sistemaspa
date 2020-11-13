class CreateCoordinadores < ActiveRecord::Migration[6.0]
  def change
    create_table :coordinadores do |t|
      t.integer :idpersona
      t.integer :idred

      t.timestamps
    end
  end
end
