class AddProgramaToTesista < ActiveRecord::Migration[6.0]
  def change
    add_column :tesistas, :programa, :string
  end
end
