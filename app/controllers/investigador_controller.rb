class InvestigadorController < ApplicationController
  def index
    @persona = Persona.find(current_usuario.persona_id)
    #@actividades = Persona.find(current_usuario.persona_id).actividades.where("estado!='X'").limit(4).order(created_at: :desc)
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("periodo=2020 and (estado!='X' and estado!='H')").order(:titulo)
  end

  def listarredes
    @redes = Red.where(id:[1,8,9,10,11,12,13,14,15,16,17,21]).order(:nomred)
  end

  def listado
    @idred = params[:idred]
    @personas = Persona.where(:tipopersona_id=>2).order(:paterno)
    #@redes = Red.where(id:[1,8,9,10,11,12,13,14,15,16,17,21])
    @redes = Red.where(id:@idred)
  end 

  def vistalista
    personaid = params[:id]
    idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       #@actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
       @actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('A','U','C','S','Z','W','G')").order(:id)
       @persona = Persona.find(personaid.to_i)
       @academico = Academico.where(persona_id:@persona.id).first
  end

  def verproducto
      @actividad = Actividad.find(params[:idprod].to_i)
      @academico =params[:idacad].to_i
      @persona = Persona.find(@academico.to_i)
      @producto = Producto.find(@actividad.producto_id)
      @dataAct = Actividad.find(@actividad.id)
  end
  
  def produccion 
    personaid = params[:id]
    idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       #@actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
       @actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('A','U','C','S','Z','W')").order(:producto_id).order(:id)
       @persona = Persona.find(personaid.to_i)
  end

  def investdetalle
    tipoper = [2,3]
    @investigador = Array.new
    Persona.where(:tipopersona_id=>tipoper).order(:paterno).each do |p|
      @investigador.push(p)
    end
  end

  def activar
    actividad = Actividad.find(params[:id].to_i)
    tipo = params[:tipo]
    if tipo == 'I'
       actividad.estado = 'A'
       actividad.save
    end 
    if tipo == 'C'
      actividad.estado = 'U'
      actividad.save
    end 
    if tipo == 'COM'
      actividad.estado = 'U'
      actividad.save
    end 
    if tipo == 'S'
      actividad.estado = 'C'
      actividad.save
    end 
   

  end

  def valcompleta
      idpersona = params[:idpersona]
      @persona = Persona.find(idpersona.to_i)
      @persona.evaluacion = "S"
      @persona.save
      puts @persona.errors.messages
  end

end