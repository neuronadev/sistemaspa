class AddFgradoToTesista < ActiveRecord::Migration[6.0]
  def change
    add_column :tesistas, :fgrado, :date
  end
end
