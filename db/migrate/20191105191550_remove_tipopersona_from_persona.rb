class RemoveTipopersonaFromPersona < ActiveRecord::Migration[6.0]
  def change

    remove_column :personas, :tipopersona, :string
  end
end
