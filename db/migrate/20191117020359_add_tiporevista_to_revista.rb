class AddTiporevistaToRevista < ActiveRecord::Migration[6.0]
  def change
    add_column :revistas, :tiporevista, :string, limit: 1
  end
end
