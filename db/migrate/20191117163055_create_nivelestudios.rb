class CreateNivelestudios < ActiveRecord::Migration[6.0]
  def change
    create_table :nivelestudios do |t|
      t.string :nomnivel, limit: 65

      t.timestamps
    end
  end
end
