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
   
     @actividad = Actividad.where(periodo:2020).where("estado in ('A','U','C','S','Z','W')").order(:producto_id).order(:id).joins(:autores).where(autores: {persona_id:personaid}) 
     
     #Autor.where(:persona_id=>personaid).each do |a|
     #    idsActiv.push(a.actividad_id) 
     # end
       #@actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
     #  @actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('A','U','C','S','Z','W')").order(:producto_id).order(:id)
       @persona = Persona.find(personaid)
  end
end
