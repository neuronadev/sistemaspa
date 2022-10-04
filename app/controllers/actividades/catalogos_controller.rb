class Actividades::CatalogosController < ApplicationController
  before_action :authenticate_usuario!

  def index
    @lista_catalogo = Producto.where(id:[1,2,3,4,5,6,7,8,11,13,14,22,37,23..36,15..19,40,41])
  end

  def listcat
      idcat = params[:idcat]
      
      if idcat == 'ini'
            @productos = Producto.where(prodcategoria_id:1, estado:['A','E']).order(:descripcion)
      else 
            @productos = Producto.where(prodcategoria_id:idcat.to_i, estado:['A','E']).order(:descripcion) 
      end

      #if idcat.to_i == 6
      #        @productos = Producto.where(prodcategoria_id:[6,7], estado:['A','E']).order(:descripcion)
      # elsif idcat == 'ini'
      #        @productos = Producto.where(prodcategoria_id:1, estado:['A','E']).order(:descripcion)
      # else
      #        @productos = Producto.where(prodcategoria_id:idcat.to_i, estado:['A','E']).order(:descripcion)
      #end   

      render partial: 'listado_cat'
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
