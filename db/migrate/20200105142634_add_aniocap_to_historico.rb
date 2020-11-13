class AddAniocapToHistorico < ActiveRecord::Migration[6.0]
  def change
    add_column :historicos, :aniocap, :integer
  end
end
