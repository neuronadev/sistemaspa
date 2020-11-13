class AddKateToLibroarbitrado < ActiveRecord::Migration[6.0]
  def change
    add_column :libroarbitrados, :kate, :integer
  end
end
