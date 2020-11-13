class EdicionesController < ApplicationController
  def index
     @idred = params[:red] 
     @idpersona = params[:persona] 
  end

  def productos
    
    redid = params[:redid]
    personaid = params[:personaid]
    actividad = nil
    if redid.to_i > 0 && personaid.to_i == 0
      actividad = Actividad.where(:asignared=>redid).where("estado in ('C','S','Z','W')").order(:titulo)
    end
    if redid.to_i > 0 && personaid.to_i > 0
      idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       actividad = Actividad.where(:id=>idsActiv).where("estado in ('C','S','Z','W')").order(:titulo)
    end
    
    if !actividad.nil?
       render json: { html: render_to_string(partial: 'datared', locals: {items:actividad,red:redid} )}
    else
      render json: { html: 'X' }
    end   
  end

  def editdata
    @idact = params[:id]
    @red = params[:red]
    @action = params[:action]
    @actividad = Actividad.find(@idact)
    @producto = Producto.find(@actividad.producto_id) 
    @actividad.autores.order("id asc")
  end

end
