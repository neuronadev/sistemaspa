class AddCorresponsalToCalprevio < ActiveRecord::Migration[6.0]
  def change
    add_column :calprevios, :corresponsal, :string
  end
end
