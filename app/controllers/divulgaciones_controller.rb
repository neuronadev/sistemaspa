class DivulgacionesController < ApplicationController
  before_action :authenticate_usuario!
  layout 'divulgaciones'
  include Pagy::Backend
  def index
    @idx_pg = params[:page] 
    @pagy, @actividades = pagy( Actividad.where(fuente:'V', periodo:2021, estado:['A','S','U','C'] ).order(created_at: :desc), page: params[:page], items: 20 )
  end

  def buscar
    @query = params[:query]
    @pagy, @actividades = pagy( Actividad.search_by_titulo(@query).where(estado:['A','S','U','C']).where(fuente:'V'), page: params[:page], items: 20 )
  
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
