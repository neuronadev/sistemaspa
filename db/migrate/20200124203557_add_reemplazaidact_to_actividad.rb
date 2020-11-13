class AddReemplazaidactToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :reemplazaidact, :integer
  end
end
