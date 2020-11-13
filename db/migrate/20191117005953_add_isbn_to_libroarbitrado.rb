class AddIsbnToLibroarbitrado < ActiveRecord::Migration[6.0]
  def change
    add_column :libroarbitrados, :isbn, :string, limit: 25
    add_column :libroarbitrados, :editores, :string
  end
end
