class CreateTipocursos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipocursos do |t|
      t.string :nomtipocurso, limit: 85

      t.timestamps
    end
  end
end
