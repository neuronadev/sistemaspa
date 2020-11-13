class AddEfterminalToTesista < ActiveRecord::Migration[6.0]
  def change
    add_column :tesistas, :efterminal, :string, limit: 2
  end
end
