class RemoveTipoinstFromAcademico < ActiveRecord::Migration[6.0]
  def change

    remove_column :academicos, :tipoinst, :string
  end
end
