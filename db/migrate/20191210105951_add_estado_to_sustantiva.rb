class AddEstadoToSustantiva < ActiveRecord::Migration[6.0]
  def change
    add_column :sustantivas, :estado, :string, limit: 1
  end
end
