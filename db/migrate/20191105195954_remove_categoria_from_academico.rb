class RemoveCategoriaFromAcademico < ActiveRecord::Migration[6.0]
  def change

    remove_column :academicos, :categoria, :string
  end
end
