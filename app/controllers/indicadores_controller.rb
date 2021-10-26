class IndicadoresController < ApplicationController
  before_action :authenticate_usuario!
  def index
    ids_prod = [1,2,5,6,7,11,12,38] 
    @actividades = Actividad.where(:producto_id=>ids_prod).where("estado = 'S' or estado='W' ").order(:producto_id)
  end
  def listaword
    ids_prod = [1,2,5,6,7] 
    @actividades = Actividad.where(:producto_id=>ids_prod).where("(estado = 'S' or estado='W') and aceptado='S' ").order(:asignared)

  end
end
