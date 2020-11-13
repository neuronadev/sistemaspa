class AddReferenciaToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :referencia, :string
  end
end
