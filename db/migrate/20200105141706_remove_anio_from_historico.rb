class RemoveAnioFromHistorico < ActiveRecord::Migration[6.0]
  def change

    remove_column :historicos, :anio, :integer
  end
end
