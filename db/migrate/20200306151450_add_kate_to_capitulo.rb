class AddKateToCapitulo < ActiveRecord::Migration[6.0]
  def change
    add_column :capitulos, :kate, :integer
  end
end
