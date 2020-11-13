class AddPersonaToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_reference :historicos, :persona, null: false, foreign_key: true
  end
end
