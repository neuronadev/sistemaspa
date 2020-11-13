class AddCodigoToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :codigo, :string
  end
end
