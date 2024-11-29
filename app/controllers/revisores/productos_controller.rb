class Revisores::ProductosController < ApplicationController
  layout :select_layout_comite

  def show
       #"comite_id"=>"6", "tecevaluacion_id"=>"171", "id"=>"11762"
       @academico = Academico.find(params[:invevaluacion_id])

       @investigadores = Utils::ProdAcademico.investigadores @datos_academico_ints.comite
       @actividad = Actividad.find(params[:id])
       @parts = Utils::UtilAutor.participantes @actividad

  end

end
