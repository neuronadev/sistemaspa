class AddPuntosToLibroarbitrado < ActiveRecord::Migration[6.0]
  def change
    add_column :libroarbitrados, :puntos, :integer
  end
end
