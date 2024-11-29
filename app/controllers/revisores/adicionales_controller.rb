class Revisores::AdicionalesController < ApplicationController
  layout :select_layout_comite

  def show #Muestra la información de la adicional

      #"comite_id"=>"6", "tecevaluacion_id"=>"171", "id"=>"11762"
      @academico = Academico.find(params[:tecevaluacion_id])

      @tecnicos = Utils::ProdAcademico.tecnicos @datos_academico_ints.comite
      @actividad = Actividad.find(params[:id])
      @parts = Utils::UtilAutor.participantes @actividad
      
  end
end