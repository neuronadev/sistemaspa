class AddEvaluacionToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :evaluacion, :string, limit: 1, default: 'N'
  end
end
