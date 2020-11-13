class AddQuizcalidadToSustantiva < ActiveRecord::Migration[6.0]
  def change
    add_column :sustantivas, :quizcalidad, :text
  end
end
