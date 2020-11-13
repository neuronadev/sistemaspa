class AddTituloToCalprevio < ActiveRecord::Migration[6.0]
  def change
    add_column :calprevios, :titulo, :string
  end
end
