class RemoveNivelacadFromAcademico < ActiveRecord::Migration[6.0]
  def change

    remove_column :academicos, :nivelacad, :string
  end
end
