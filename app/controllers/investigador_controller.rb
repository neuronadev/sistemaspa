class InvestigadorController < ApplicationController
  def index
    @persona = Persona.find(current_usuario.persona_id)
    #@actividades = Persona.find(current_usuario.persona_id).actividades.where("estado!='X'").limit(4).order(created_at: :desc)
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("periodo=2020 and (estado!='X' and estado!='H')").order(:titulo)
  end

  def listado
    @personas = Persona.where(:tipopersona_id=>2).order(:paterno)
    @redes = Red.where(id:[1,8,9,10,11,12,13,14,15,16,17,21])
  end 

  def produccion 
    personaid = params[:id]
    idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       @actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
       @persona = Persona.find(personaid.to_i)
  end

  def investdetalle
    tipoper = [2,3]
    @investigador = Array.new
    Persona.where(:tipopersona_id=>tipoper).order(:paterno).each do |p|
      @investigador.push(p)
    end
  end

end