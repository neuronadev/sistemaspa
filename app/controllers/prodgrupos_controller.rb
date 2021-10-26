class ProdgruposController < ApplicationController
  before_action :authenticate_usuario!
  def index
     @prodgrupos = Prodgrupo.where("estado='A'").order(:nomgrupo)
  end

  def new
    @prodgrupo = Prodgrupo.new
  end

  def create
    @prodgrupo = Prodgrupo.new(prodgrupo_params)
    respond_to do |format|     
      if @prodgrupo.valid?
          if @prodgrupo.save
             flash[:notice] = "Grupo registrada correctamente"
             format.html {redirect_to prodgrupos_path} 
          end
       else    
         flash[:error] = "Error, propocione la información."
         format.html {render :action=>'new'}
      end
  end

  end

  def edit
    idgrupo = params[:id] 
    @prodgrupo = Prodgrupo.find(idgrupo)

  end

  def show
  end

  def update
    idgp = params[:id]
    @prodgrupo = Prodgrupo.find(idgp)
    @prodgrupo.update(prodgrupo_params)
    redirect_to prodgrupos_path
  end

  def destroy
    id = params[:id]
    prodgp = Prodgrupo.find(id)
    prodgp.update(estado:'X')
    redirect_to prodgrupos_path
  end

  private def prodgrupo_params
      params.require(:prodgrupo).permit(:nomgrupo)
  end

end
