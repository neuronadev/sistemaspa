class DropActividadesAutores < ActiveRecord::Migration[6.0]
  def change
     drop_table :actividades_autores
  end
end
