class AddIndexToActividad < ActiveRecord::Migration[6.0]
  def change
    add_index :actividades, :estado
  end
end
