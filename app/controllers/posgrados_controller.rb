class PosgradosController < ApplicationController
  before_action :authenticate_usuario!
  layout :type_layout

  def index
      @cursos = Actividad.where(producto_id:[82,83], fuente:'P',estado:['U','A','S','C'], periodo:2021)
  end

  def new
    @tipo = params[:tipo] 
    @actividad = Actividad.new
    @actividad.build_curso
    @actividad.build_tesista

    if @tipo == 'C'
        @producto = Producto.find(82)
    else
        @producto = Producto.find(83)
    end

  end

  def create
  end

  def show
     id = params[:id]
     @curso = Actividad.find(id)
    
  end

  def edit
    id = params[:id] 
    @actividad = Actividad.find(id)
    @producto = Producto.find(@actividad.producto_id)
  end

  def update
  end

  def type_layout
      if current_usuario.persona_id == 105
         "investigador"
      else
        "posgrados" 
      end     
  end

end
