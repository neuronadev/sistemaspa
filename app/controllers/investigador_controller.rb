class InvestigadorController < ApplicationController
  def index
    @persona = Persona.find(current_usuario.persona_id)
    #@actividades = Persona.find(current_usuario.persona_id).actividades.where("estado!='X'").limit(4).order(created_at: :desc)
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("periodo=2020 and (estado!='X' and estado!='H')").order(:titulo)
  end

  def listado
    @personas = Persona.where(:tipopersona_id=>2).order(:paterno)
     
  end 

  def produccion 
    personaid = params[:id]
    idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       @actividad = Actividad.where(:id=>idsActiv).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
  end

  def investdetalle
    tipoper = [2,3]
    @investigador = Array.new
    Persona.where(:tipopersona_id=>tipoper).order(:paterno).each do |p|
      @investigador.push(p)
    end
  end

end