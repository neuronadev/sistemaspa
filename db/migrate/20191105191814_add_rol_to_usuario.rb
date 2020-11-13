class AddRolToUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :rol, :string, limit: 1
  end
end
