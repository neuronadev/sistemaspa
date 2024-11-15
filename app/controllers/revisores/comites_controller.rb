class Revisores::ComitesController < ApplicationController
  before_action :select_layout
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

  def select_layout_comite
       if @datos_academico_ints.comite.rol == 'ADM'
             "revisores/administrador"
       end             
  end

  private
  def comites_params
       params.require(:comite).permit(
                  :academico_id,
                  :catevaluador_id
       )
  end

end
