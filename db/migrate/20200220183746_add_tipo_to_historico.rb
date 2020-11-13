class AddTipoToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :tipo, :string, limit: 20
  end
end
