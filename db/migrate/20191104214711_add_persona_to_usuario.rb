class AddPersonaToUsuario < ActiveRecord::Migration[6.0]
  def change
    add_reference :usuarios, :persona, null: false, foreign_key: true
  end
end
