class CreatePaises < ActiveRecord::Migration[6.0]
  def change
    create_table :paises do |t|
      t.string :nompais, limit: 85

      t.timestamps
    end
  end
end
