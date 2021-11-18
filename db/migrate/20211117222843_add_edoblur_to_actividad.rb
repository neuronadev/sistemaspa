class AddEdoblurToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :edoblur, :char
  end
end
