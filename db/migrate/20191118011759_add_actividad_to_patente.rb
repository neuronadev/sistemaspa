class AddActividadToPatente < ActiveRecord::Migration[6.0]
  def change
    add_reference :patentes, :actividad, null: false, foreign_key: true
  end
end
