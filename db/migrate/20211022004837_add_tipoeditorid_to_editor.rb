class AddTipoeditoridToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :tipoeditorid, :integer
  end
end
