class Evaluaciones::EvaltecnicosController < ApplicationController
  add_flash_types :info
  def index
     @sustantivas = Evaltecnico.where(persona_id: current_usuario.persona_id)
     @evaltecnico = Evaltecnico.new
     @evaltecnico.itemsustantivas.build

     if !@sustantivas.any? 
          flash[:info] = "No ha registrado actividades sustantivas" 
     else
          flash[:info] = "" 
     end

  end

  def show
  end

  def new
    @evaltecnico =  Evaltecnico.new
    @evaltecnico.itemsustantivas.build
  end

  def create
  end

  def edit
  end

  def update
  end
end
