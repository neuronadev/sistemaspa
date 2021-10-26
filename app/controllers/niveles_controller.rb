class NivelesController < ApplicationController
  before_action :authenticate_usuario!
  def index
    @niveles = Nivel.all.order(:nomnivel)
  end

  def new
    @nivel = Nivel.new
  end

  def create
     @nivel = Nivel.new(nivel_params)

     if @nivel.valid?
         @nivel.save
     end
  end

  def show
    nivel_id = params[:id]
    @nivel = Nivel.find(nivel_id)
  end

  def update
    nivel_id = params[:id]
    @nivel = Nivel.find(nivel_id)
    @nivel.update(nivel_params)
  end

  def destroy
      redirect_to :action => :index
  end

  private def nivel_params
    params.require(:nivel).permit(:nomnivel, :clavenivel)
  end

end
