class Valactividades::ValidacionesController < ApplicationController
  layout 'validaactividades'
  def index
    @actividades = Actividad.where(estado:'C').order(:id)
  end
end
