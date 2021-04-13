class AddAnioToEstimulo < ActiveRecord::Migration[6.0]
  def change
    add_column :estimulos, :anio, :integer
  end
end
