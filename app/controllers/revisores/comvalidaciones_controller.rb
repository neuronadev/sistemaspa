class Revisores::ComvalidacionesController < ApplicationController
  layout :select_layout_comite
  def index
      @comite = Comite.includes(:catevaluador).where('catevaluadores.clave':'CT').where(estado:'A')
  end

  def new
      @comvalidacion = Comvalidacion.new
      @comite = Comite.find(params[:comite_id])
  end

  def create
      @comvalidacion = Comvalidacion.new(comvalidaciones_params)
      @comite = Comite.find(params[:comite_id])
      respond_to do |format|
         if @comvalidacion.save
            @data = Comvalidacion.where(comite_id:@comite.id)
            @comvalidacion = Comvalidacion.new
            format.html { redirect_to [:asignado, :revisores, @comite] } 
         end
      end  
  end

  def edit
  end

  private 
  def comvalidaciones_params
       params.require(:comvalidacion).permit(
              :comite_id,
              :academico_id
       )
  end

end
