class AddNocontrolToCalprevio < ActiveRecord::Migration[6.0]
  def change
    add_column :calprevios, :nocontrol, :string
  end
end
