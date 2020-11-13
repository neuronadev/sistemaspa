class AddCorresponsalToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :corresponsal, :string, limit: 2
  end
end
