class AddNpartsToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :nparts, :integer
  end
end
