class AddMotivoToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :motivo, :text
  end
end
