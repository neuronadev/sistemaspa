class Actividades::CatalogosController < ApplicationController
  def index
    @lista_catalogo = Producto.where(id:[1,2,3,4,5,6,7,8,11,13,14,22,37,23..36,15..19,40,41])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
