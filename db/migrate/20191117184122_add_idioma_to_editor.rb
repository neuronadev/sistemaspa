class AddIdiomaToEditor < ActiveRecord::Migration[6.0]
  def change
    add_reference :editores, :idioma, null: false, foreign_key: true
  end
end
