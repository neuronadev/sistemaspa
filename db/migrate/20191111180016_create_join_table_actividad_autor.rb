class CreateJoinTableActividadAutor < ActiveRecord::Migration[6.0]
  def change
    create_join_table :actividades, :autores do |t|
       t.index [:actividad_id, :autor_id]
       t.index [:autor_id, :actividad_id]
    end
  end
end
