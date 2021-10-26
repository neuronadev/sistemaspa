class InicioController < ApplicationController
  before_action :authenticate_usuario!
  def sesion
    
    if current_usuario.rol == 'S'
        redirect_to administrador_path   
    end
    if current_usuario.rol == 'I'
      redirect_to investigador_path   
    end
    if current_usuario.rol == 'C'
      redirect_to investigador_path   
    end
    if current_usuario.rol == 'T'
      redirect_to tecnico_path   
    end
    if current_usuario.rol == 'D'
       redirect_to auditoria_path   
    end
    if current_usuario.rol == 'V'
      redirect_to divulgaciones_path   
   end
   if current_usuario.rol == 'P'
       redirect_to posgrados_path   
   end

  end
end
