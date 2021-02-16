class AddComprobanteToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :comprobante, :string
  end
end
