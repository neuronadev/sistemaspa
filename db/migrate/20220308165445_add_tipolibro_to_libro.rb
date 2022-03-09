class AddTipolibroToLibro < ActiveRecord::Migration[6.0]
  def change
    add_column :libros, :tipolibro_id, :integer
  end
end
