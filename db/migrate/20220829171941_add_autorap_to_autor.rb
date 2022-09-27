class AddAutorapToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :autorap, :string
  end
end
