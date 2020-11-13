class AddClaveToTipopersona < ActiveRecord::Migration[6.0]
  def change
    add_column :tipopersonas, :clave, :string, limit: 1
  end
end
