class AddEvaluaToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :evalua, :integer
  end
end
