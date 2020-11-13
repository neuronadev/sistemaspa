class CreatePersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :personas do |t|
      t.string :nombre, limit: 45
      t.string :paterno, limit: 45
      t.string :materno, limit: 45
      t.string :email, limit: 50
      t.string :genero, limit: 1
      t.string :estado, limit: 1
      t.string :tipopersona, limit: 1

      t.timestamps
    end
  end
end
