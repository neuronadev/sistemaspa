class Revisores::ComitesController < ApplicationController
  layout :select_layout_comite

  def index
       @comites = Comite.where(estado:'A')
  end

  def show
      @comite = Comite.find(params[:id]) 
  end

  def new
      @comite = Comite.new
  end

  def create
      @comite = Comite.new(comites_params)
      respond_to do |format|
        if @comite.save
            format.html { redirect_to [:revisores, @comite] } 
        end
      end  
  end

  def edit
  end

  def update
  end

  def asignado
      @comite = Comite.find(params[:id])
      @asignados = Comvalidacion.where(comite_id:@comite.id) 
  end

  private
  def comites_params
       params.require(:comite).permit(
                  :academico_id,
                  :catevaluador_id
       )
  end

end
