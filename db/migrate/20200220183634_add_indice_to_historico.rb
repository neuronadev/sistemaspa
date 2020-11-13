class AddIndiceToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :indice, :string, limit: 10
  end
end
