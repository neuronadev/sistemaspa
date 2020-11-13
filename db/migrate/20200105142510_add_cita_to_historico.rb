class AddCitaToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :cita, :string
  end
end
