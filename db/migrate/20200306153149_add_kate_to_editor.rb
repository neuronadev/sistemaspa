class AddKateToEditor < ActiveRecord::Migration[6.0]
  def change
    add_column :editores, :kate, :integer
  end
end
