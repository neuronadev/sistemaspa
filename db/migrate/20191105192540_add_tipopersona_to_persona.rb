class AddTipopersonaToPersona < ActiveRecord::Migration[6.0]
  def change
    add_reference :personas, :tipopersona, null: false, foreign_key: true
  end
end
