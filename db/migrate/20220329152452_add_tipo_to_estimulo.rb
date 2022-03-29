class AddTipoToEstimulo < ActiveRecord::Migration[6.0]
  def change
    add_column :estimulos, :tipo, :string
  end
end
