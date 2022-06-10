class AddEstadoToPais < ActiveRecord::Migration[6.0]
  def change
    add_column :paises, :estado, :string
  end
end
