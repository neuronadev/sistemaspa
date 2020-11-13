class CreateCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :cursos do |t|
      t.date :fini
      t.date :ffin
      t.decimal :hcurso, precision: 7, scale: 2
      t.decimal :himpartidas, precision: 7, scale: 2
      t.decimal :creditos, precision: 7, scale: 2
      t.integer :noalumnos
      t.string :externo, limit: 2
      t.references :actividad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
