class RemoveAutoresFromHistorico < ActiveRecord::Migration[6.0]
  def change

    remove_column :historicos, :autores, :string
  end
end
