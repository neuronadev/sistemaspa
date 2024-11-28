class Revisores::AdicionalesController < ApplicationController
  layout :select_layout_comite
  def show
      #"comite_id"=>"6", "tecevaluacion_id"=>"171", "id"=>"11762"
      @academico = Academico.find(params[:tecevaluacion_id])
      @tecnicos = Comvalidacion
                  .where(comite_id:@datos_academico_ints.comite.id)
                  .includes(academico: [:persona]).where('personas.tipopersona_id':4).order('personas.nombre')
      @actividad = Actividad.find(params[:id])
      @parts = Utils::UtilAutor.participantes @actividad
      
  end
end