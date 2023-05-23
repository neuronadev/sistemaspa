class PuntosController < ApplicationController
  def index
      @puntos = Punto.where(persona_id:current_usuario.persona_id)
  end

  def show
  end
end
