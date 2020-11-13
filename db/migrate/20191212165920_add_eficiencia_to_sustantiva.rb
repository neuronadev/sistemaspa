class AddEficienciaToSustantiva < ActiveRecord::Migration[6.0]
  def change
    add_column :sustantivas, :eficiencia, :decimal, precision: 7, scale: 2
  end
end
