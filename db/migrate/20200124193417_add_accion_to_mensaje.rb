class AddAccionToMensaje < ActiveRecord::Migration[6.0]
  def change
    add_column :mensajes, :accion, :string, limit: 2
  end
end
