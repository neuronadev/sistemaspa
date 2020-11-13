class DropRevistas < ActiveRecord::Migration[6.0]
  def change
    drop_table :revistas
  end
end
