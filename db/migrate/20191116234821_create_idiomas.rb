class CreateIdiomas < ActiveRecord::Migration[6.0]
  def change
    create_table :idiomas do |t|
      t.string :nomidioma, limit: 75

      t.timestamps
    end
  end
end
