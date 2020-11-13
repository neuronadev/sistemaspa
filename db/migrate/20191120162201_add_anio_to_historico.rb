class AddAnioToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :anio, :integer
  end
end
