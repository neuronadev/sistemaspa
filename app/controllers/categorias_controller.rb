class CategoriasController < ApplicationController
  before_action :authenticate_usuario!
  def index
    @categorias = Categoria.all.order(:nomcategoria)
  end

  def new
    @categoria = Categoria.new
  end

  def create
     @categoria = Categoria.new(categoria_params)
     if @categoria.valid?
         @categoria.save
     end
  end

  def show
    cat_id = params[:id]
    @categoria = Categoria.find(cat_id)
  end

  def update
    cat_id = params[:id]
    @categoria = Categoria.find(cat_id)
    @categoria.update(categoria_params)
  end

  def destroy
    redirect_to :action => :index
  end

  private def categoria_params
    params.require(:categoria).permit(:nomcategoria,:clavecategoria)
  end

end
