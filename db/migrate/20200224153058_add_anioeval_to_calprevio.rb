class AddAnioevalToCalprevio < ActiveRecord::Migration[6.0]
  def change
    add_column :calprevios, :anioeval, :integer
  end
end
