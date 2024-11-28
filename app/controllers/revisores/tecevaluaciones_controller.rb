class Revisores::TecevaluacionesController < ApplicationController
  layout :select_layout_comite

  def index  #academicos asignados al integrante del comite
      @tecnicos = Comvalidacion
                  .where(comite_id:@datos_academico_ints.comite.id)
                  .includes(academico: [:persona]).where('personas.tipopersona_id':4).order('personas.nombre')
      @adicionales = 'ini'
  end

  def show #mostrar las adicionales del academico
      @academico = Academico.find(params[:id])
      @adicionales = Actividad
                      .where(estado:['U','C','G'], periodo:2024)
                      .includes(:autores).where('autores.persona_id': @academico.persona.id)
                      .order(:titulo)
                      
      @tecnicos = Comvalidacion
                  .where(comite_id:@datos_academico_ints.comite.id)
                  .includes(academico: [:persona]).where('personas.tipopersona_id':4).order('personas.nombre')
  end

end
