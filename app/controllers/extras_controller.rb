class ExtrasController < ApplicationController
  def index
    @extras = Extra.where(persona_id:current_usuario.persona_id)
  end

  def show
  end

  def new
     @extra = Extra.new
  end
  
  def create
    @extra = Extra.new(extra_params) 
      if @extra.save
         redirect_to extras_path 
      end
  end
  

  private def extra_params
     params.require(:extra).permit(:persona_id,:descripcion,:documento)
  end
end
