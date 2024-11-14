class DivulgacionesController < ApplicationController
  before_action :authenticate_usuario!
  layout 'divulgaciones'
  include Pagy::Backend

  def index
    #@idx_pg = params[:page]
    #@pagy, @actividades = pagy( Actividad.where(producto_id:[39,22], periodo:[2024], estado:['U','C'] ).order(created_at: :desc), page: params[:page], items: 20 )
    @actividades = Actividad.where(producto_id:[39,22], periodo:[2024], estado:['U','C'] ).order(created_at: :desc)
  end

  def buscar
    @query = params[:query]
    #@pagy, @actividades = pagy( Actividad.search_by_titulo(@query).where(estado:['S','U','C']).where(fuente:'V'), page: params[:page], items: 20 )
    @actividades = Actividad.search_by_titulo(@query).where(periodo:[2024], estado:['S','U','C']).where(fuente:'V')
  
    #render partial: 'listado', locals: {pubs:r }
 end


  def new
    @tipo = params[:tipo] 
    @actividad = Actividad.new
    #@actividad.autores.build
    @actividad.build_articulo
    @actividad.build_divulgacion
  end

  def create
  end

  def show
    id = params[:id] 
    @actividad = Actividad.find(id)
  end

  def edit
    id = params[:id] 
    @actividad = Actividad.find(id)
    @producto = Producto.find(@actividad.producto_id)
  end

  def update
  end


end
