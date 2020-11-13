class RemoveFolioFromHistorico < ActiveRecord::Migration[6.0]
  def change

    remove_column :historicos, :folio, :string
  end
end
