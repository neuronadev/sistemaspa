class ProdcategoriasController < ApplicationController
  def index
    @prodcategorias = Prodcategoria.where("estado = 'A'").order(:nomcategoria)
    
  end

  def new
    @prodcategoria = Prodcategoria.new
  end

  def create
     @prodcategoria = Prodcategoria.new(prodcategoria_params)
     respond_to do |format|     
         if @prodcategoria.valid?
             if @prodcategoria.save
                flash[:notice] = "Categoria registrada correctamente"
                format.html {redirect_to prodcategorias_path} 
             end
          else    
            flash[:error] = "Error, propocione la información."
            format.html {render :action=>'new'}
         end
     end
  end

  def show
  end

  def edit
    idcat = params[:id] 
    @prodcategoria = Prodcategoria.find(idcat)

  end

  def update
    idcat = params[:id]
    @prodcategoria = Prodcategoria.find(idcat)
    @prodcategoria.update(prodcategoria_params)
    redirect_to prodcategorias_path
  end

  def destroy
    id = params[:id]
    prodcat = Prodcategoria.find(id)
    prodcat.update(estado:'X')
    redirect_to prodcategorias_path
  end

  private def prodcategoria_params
    params.require(:prodcategoria).permit(:nomcategoria)
  end


end
