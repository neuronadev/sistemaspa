class RemoveTipoeditorFromEditor < ActiveRecord::Migration[6.0]
  def change
    remove_reference :editores, :tipoeditor, null: false, foreign_key: true
  end
end
