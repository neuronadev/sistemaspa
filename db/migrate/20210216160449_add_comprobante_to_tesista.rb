class AddComprobanteToTesista < ActiveRecord::Migration[6.0]
  def change
    add_column :tesistas, :comprobante, :string
  end
end
