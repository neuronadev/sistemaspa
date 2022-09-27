class AddAutornomToAutor < ActiveRecord::Migration[6.0]
  def change
    add_column :autores, :autornom, :string
  end
end
