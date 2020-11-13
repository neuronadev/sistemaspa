class LibrosController < ApplicationController
  def index
    @libros = Libro.where("estado='A'").order(:nomlibro)
  end

  def new
    @libro = Libro.new 
  end

  def create
    @libro = Libro.new(libro_params)
     respond_to do |format|
         if @libro.valid?
             if @libro.save
                 flash[:notice] = 'Registro ok...'
                 format.html {redirect_to libros_path}
                 format.js
             end
         else
            flash[:error] = "Error, la información esta incompleta."
            format.html {render :action=>'new'}
            format.js
         end
      end   
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private def libro_params
    params.require(:libro).permit(:nomlibro,:editores,:isbn,:anio,:nopaginas,:editorial_id)
  end


end
