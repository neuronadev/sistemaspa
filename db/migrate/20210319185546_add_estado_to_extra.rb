class AddEstadoToExtra < ActiveRecord::Migration[6.0]
  def change
    add_column :extras, :estado, :string, limit: 1
  end
end
