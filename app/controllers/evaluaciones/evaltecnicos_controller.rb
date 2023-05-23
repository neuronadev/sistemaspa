class Evaluaciones::EvaltecnicosController < ApplicationController
  add_flash_types :info

  def index
     @sustantivas = Evaltecnico.where(persona_id: current_usuario.persona_id, anio:2023)
     

     if !@sustantivas.any? 
          flash[:info] = "No ha registrado actividades sustantivas" 
          redirect_to new_evaluaciones_evaltecnico_path
     else
          flash[:info] = nil
     end

  end

  def show
  end

  def new
    @evaltecnico =  Evaltecnico.new
    @evaltecnico.itemsustantivas.build
  end

  def create
      @evaltecnico = Evaltecnico.new(evaltecnico_params)
      if @evaltecnico.valid?
           @evaltecnico.save
           redirect_to evaluaciones_evaltecnicos_path
      end
  end

  def edit
      
  end

  def update
  end

  private 
  def evaltecnico_params
      params.require(:evaltecnico).permit( :persona_id, :anio, itemsustantivas_attributes:[:id, :persona_id, :descripcion, :porcentaje, :_destroy] )
  end


end
