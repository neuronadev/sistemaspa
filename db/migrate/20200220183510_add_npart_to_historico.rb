class AddNpartToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :npart, :integer
  end
end
