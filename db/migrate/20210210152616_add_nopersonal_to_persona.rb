class AddNopersonalToPersona < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :nopersonal, :integer
  end
end
