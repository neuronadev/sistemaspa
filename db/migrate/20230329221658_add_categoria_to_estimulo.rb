class AddCategoriaToEstimulo < ActiveRecord::Migration[6.0]
  def change
    add_column :estimulos, :categoria, :text
  end
end
