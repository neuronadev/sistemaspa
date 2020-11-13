class AddPuntosToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :puntos, :integer
  end
end
