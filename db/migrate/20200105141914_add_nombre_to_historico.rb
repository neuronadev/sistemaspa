class AddNombreToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :nombre, :string
  end
end
