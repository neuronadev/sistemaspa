class RevistasController < ApplicationController
  def index
    @revistas = Revista.where("estado='A'").order(:nomrevista)
  end

  def new
    @revista = Revista.new
  end

  def create
    @revista = Revista.new(revista_params)
     respond_to do |format|
         if @revista.valid?
             if @revista.save
                 flash[:notice] = 'Registro ok...'
                 format.html {redirect_to revistas_path}
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

  private def revista_params
    params.require(:revista).permit(:nomrevista,:cuartil,:factor,:issn,:eissn,:editorial_id,:tiporevista)
  end

end
