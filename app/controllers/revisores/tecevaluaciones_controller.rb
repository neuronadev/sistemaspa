class Revisores::TecevaluacionesController < ApplicationController
  layout :select_layout_comite

  def index  #academicos asignados al integrante del comite
      @tecnicos = Utils::ProdAcademico.tecnicos @datos_academico_ints.comite
      @adicionales = 'ini'
      
  end

  def show #mostrar las adicionales del academico
      @academico = Academico.find(params[:id])

      @adicionales = Utils::ProdAcademico.adicionales @academico
      @tecnicos = Utils::ProdAcademico.tecnicos @datos_academico_ints.comite                      
  end

end
