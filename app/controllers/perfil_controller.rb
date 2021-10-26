class PerfilController < ApplicationController
  before_action :authenticate_usuario!
  def index
  end
  def show
    idp = params[:id]
    @persona = Persona.find(idp)
  end
  def edit
    idp = params[:id]
    @persona = Persona.find(idp)
  end
  def update
  end


  private def perfil_params

  end


end
