class AddTdivulgacionToDivulgacion < ActiveRecord::Migration[6.0]
  def change
    add_column :divulgaciones, :tdivulacion_id, :integer
  end
end
