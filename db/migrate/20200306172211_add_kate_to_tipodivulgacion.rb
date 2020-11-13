class AddKateToTipodivulgacion < ActiveRecord::Migration[6.0]
  def change
    add_column :tipodivulgaciones, :kate, :integer
  end
end
