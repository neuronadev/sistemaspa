class AcademicosController < ApplicationController
  def index

  end

  def show
  end

  def actividadt
    idacademico = params[:idacadem]
    academico = Academico.find(idacademico)

    personaid = academico.persona_id
    idsActiv = Array.new
   
     @actividad = Actividad.where(periodo:2020).where("estado in ('S','A','U','G','Z')").order(:producto_id).order(:id).joins(:autores).where(autores: {persona_id:personaid}) 
     
     #Autor.where(:persona_id=>personaid).each do |a|
     #    idsActiv.push(a.actividad_id) 
     # end
       #@actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
     #  @actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('A','U','C','S','Z','W')").order(:producto_id).order(:id)
       @persona = Persona.find(personaid)
  end

  def activar
    @idactividad = params[:id]
    @txt = params[:txt]
    actividad = Actividad.find(@idactividad.to_i)
    actividad.estado = 'G'
    actividad.save
    
    mensaje = Mensaje.create(actividad_id:@idactividad, persona_id: current_usuario.persona_id, tipo:'C', estado:'A', txt:@txt)
    
    respond_to do |format| 
      format.js
    end
  end

  def anularactiv
    @idactividad = params[:id]
    actividad = Actividad.find(@idactividad.to_i)
    actividad.estado = 'U'
    actividad.save
    mensaje = Mensaje.where(actividad_id:@idactividad.to_i).where(tipo:'C').where(estado:'A').first
    mensaje.estado = 'X'
    mensaje.save
    respond_to do |format| 
      format.js
    end
  end

  def cerrarmensaje
    @idactividad = params[:id]
    mensaje = Mensaje.where(actividad_id:@idactividad.to_i).where(tipo:'C').where(estado:'A').first
    mensaje.estado = 'X'
    mensaje.save
    respond_to do |format| 
      format.js
    end
  end

end
