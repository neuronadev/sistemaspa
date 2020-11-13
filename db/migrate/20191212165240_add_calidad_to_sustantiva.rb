class AddCalidadToSustantiva < ActiveRecord::Migration[6.0]
  def change
    add_column :sustantivas, :calidad, :decimal, precision: 7, scale: 2
  end
end
