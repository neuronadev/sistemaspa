class RedesController < ApplicationController
  def index
    @redes = Red.all.order(:nomred)
  end

  def new
    @red = Red.new
  end

  def create
    @red = Red.new(red_params)
    respond_to do |format|  
      if @red.valid?
          
            if @red.save
               format.html {redirect_to redes_path, notice:'Registro ok..'}
               format.js
            end
          
         else
            flash[:error] = "Error, falta información..."
            format.html {render :action=>'new'}
            #flash[:error] = "Error, falta información..."
            #render :new
      end 
    end    
    
  end

  def show
    red_id = params[:id]
    @red = Red.find(red_id)
  end

  def update
    red_id = params[:id]
    @red = Red.find(red_id)
    @red.update(red_params)
  end

  def destroy
    red_id = params[:id]
    red = Red.find(red_id)
    red.destroy

    redirect_to :action => :index
  end


  private def red_params
    params.require(:red).permit(:nomred,:clavered)
  end

end
