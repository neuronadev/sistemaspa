class AddFactoriToCuartil < ActiveRecord::Migration[6.0]
  def change
    add_column :cuartiles, :factori, :decimal, precision: 16, scale: 2
  end
end
