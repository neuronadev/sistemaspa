class AddFirmaToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :firma, :string
  end
end
