class AddRedToAcademico < ActiveRecord::Migration[6.0]
  def change
    add_reference :academicos, :red, null: false, foreign_key: true
  end
end
