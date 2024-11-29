class Revisores::InvevaluacionesController < ApplicationController
  layout :select_layout_comite
  def index
      @investigadores = Utils::ProdAcademico.investigadores @datos_academico_ints.comite 
      @productos = 'ini'
  end

  def show
      @academico = Academico.find(params[:id])

      @productos = Utils::ProdAcademico.productos @academico
      @investigadores = Utils::ProdAcademico.investigadores @datos_academico_ints.comite      
  end
end
