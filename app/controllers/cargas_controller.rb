class CargasController < ApplicationController
  def index
  end

  def show
  end

  def new
    
  end

  def edit
  end

  def create
  end
  
  def comprobante
      #posgrado
      idactiv = params[:id]
      nombre = params[:comprobante] 
      actividad = Actividad.find(idactiv.to_i)
      path = "/home/deploy/posgrado" + "/" + actividad.periodo.to_s + "/" + nombre+".pdf"
      send_file path, disposition: 'inline', content_type: "application/pdf"
      
  end
end