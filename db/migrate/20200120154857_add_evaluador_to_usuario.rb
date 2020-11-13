class AddEvaluadorToUsuario < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :evaluador, :string, limit: 1
  end
end
