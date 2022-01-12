class AddAplicarToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :aplicar, :string, limit: 1
  end
end
