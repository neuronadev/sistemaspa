class Evaluaciones::EvaltecnicosController < ApplicationController
  add_flash_types :info

  def index
     @sustantivas = Evaltecnico.where(persona_id: current_usuario.persona_id, anio:2023)
     @total_porc = 0.0
     @sustantivas.each do |s|
         s.itemsustantivas.each do |item| 
             @total_porc += item.porcentaje
         end     
     end

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

  def sustedit
        @itemsust = Itemsustantiva.find(params[:id])
  end
  
  def sustupdate
       @itemsustantiva = Itemsustantiva.find(params[:id])
       @itemsustantiva.update(itemsustantiva_params)
       respond_to do |format|
           if @itemsustantiva.save
                flash[:info] = "Registro actualizado." 
                format.html {redirect_to evaluaciones_evaltecnicos_path}
           else
               format.html {render :sustedit, status: :bad_request}
           end
       end   
  end

  def update
       
  end

  private 
  def evaltecnico_params
      params.require(:evaltecnico).permit( :persona_id, :anio, itemsustantivas_attributes:[:id, :persona_id, :descripcion, :porcentaje, :_destroy] )
  end

  def itemsustantiva_params
       params.require(:itemsustantiva).permit( :persona_id, :descripcion, :porcentaje )
  end
  
end
