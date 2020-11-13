class AddFechapubToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :fechapub, :date
  end
end
