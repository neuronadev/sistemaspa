class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :nomrol
      t.string :estado, limit: 1

      t.timestamps
    end
  end
end
