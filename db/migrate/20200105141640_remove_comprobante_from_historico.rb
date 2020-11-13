class RemoveComprobanteFromHistorico < ActiveRecord::Migration[6.0]
  def change

    remove_column :historicos, :comprobante, :string
  end
end
