class RevicionesController < ApplicationController
  before_action :authenticate_usuario!
 def listado
    lista = Array.new
    Evaluador.where(:evaluadorid => current_usuario.persona_id ).each do |l|
       lista.push(l.evaluadoid)
    end
   
    @personas = Persona.where(:id=>lista)
 end
 def registros
    personaid = params[:personaid]
    actividad = nil
    actividad = Actividad.where(:personaid=>personaid).where("estado in ('U','S','Z','W')").order(:producto_id).order(:id)
    
    if !actividad.nil?
       render json: { html: render_to_string(partial: 'productos', locals: {items:actividad,personaid:personaid} )}
    else
      render json: { html: 'X' }
    end   
 end

 def datadetalle
    activ_id = params[:id]
    @actividad = Actividad.find(activ_id)

    @listaProds = ''
    Producto.All.order(:descripcion).each do |p|
      if p.id == @actividad.producto.id
        @listaProds = @listaProds  + "<option value='#{p.id}' selected>#{p.descripcion}</option>"
      else
        @listaProds = @listaProds  + "<option value='#{p.id}'>#{p.descripcion}</option>"
      end
    end
     @lista_aut = ''
     @actividad.autores.order("posicion asc").each do |a|
      if a.persona_id != 211 && a.persona_id != 212
         @lista_aut = @lista_aut + "<option value='#{a.id}'>#{(a.persona.paterno||'')+' '+(a.persona.materno||'')+' '+(a.persona.nombre||'')}</option>"
      end 
      end

    respond_to do |format|
      format.html
      format.js
    end
  end 



  
end
