class AddAmbitoToEditor < ActiveRecord::Migration[6.0]
  def change
    add_reference :editores, :ambito, null: false, foreign_key: true
  end
end
