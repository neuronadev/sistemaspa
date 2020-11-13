class AddNivelToAcademico < ActiveRecord::Migration[6.0]
  def change
    add_reference :academicos, :nivel, null: false, foreign_key: true
  end
end
