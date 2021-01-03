class AcademicosController < ApplicationController
  def index

  end

  def show
  end

  def actividadt
    @academico = params[:idacadem]

    personaid = params[:idacadem]
    idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       #@actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
       @actividad = Actividad.where(:id=>idsActiv).where(periodo:2020).where("estado in ('A','U','C','S','Z','W')").order(:producto_id).order(:id)
       @persona = Persona.find(personaid.to_i)
  end
end
