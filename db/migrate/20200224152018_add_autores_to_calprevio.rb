class AddAutoresToCalprevio < ActiveRecord::Migration[6.0]
  def change
    add_column :calprevios, :autores, :string
  end
end
