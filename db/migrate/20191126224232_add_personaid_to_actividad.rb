class AddPersonaidToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :personaid, :integer
  end
end
