class AddClaveToProdgrupo < ActiveRecord::Migration[6.0]
  def change
    add_column :prodgrupos, :clave, :string, limit: 25
  end
end
