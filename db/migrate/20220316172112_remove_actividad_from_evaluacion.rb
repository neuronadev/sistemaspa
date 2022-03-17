class RemoveActividadFromEvaluacion < ActiveRecord::Migration[6.0]
  def change
    remove_reference :evaluaciones, :actividad, null: false, foreign_key: true
  end
end
