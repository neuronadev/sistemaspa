class AddActaToTesista < ActiveRecord::Migration[6.0]
  def change
    add_column :tesistas, :acta, :string
  end
end
