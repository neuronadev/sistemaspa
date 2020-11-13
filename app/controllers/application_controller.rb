class ApplicationController < ActionController::Base
     

     before_action :select_layout, if: :authenticate_usuario!
     layout :select_layout
    
     protected def select_layout
         
         if !current_usuario.nil?
               ambitos_select  
               if current_usuario.rol == 'S'
                    "administrar"
               elsif current_usuario.rol == 'I'
                    "investigador"
               elsif current_usuario.rol == 'C'
                    "investigador"
               elsif current_usuario.rol == 'T'
                    "tecnico"
               else
                    "application"
               end
          end      
     end

      private def ambitos_select
          @usuario_nom =  (current_usuario.persona.nombre) + " " + (current_usuario.persona.paterno||'')
          @especializada = {"SI":"S", "NO":"N"}
          @corresponsal = {"SI":"S", "NO":"N"}
          @niveldecreto = {"Municipal":"M", "Estatal":"E", "Federal":"F"}
          @ordenamiento = {"Aceptado":"A", "Publicado":"P"}
          @niveliniciativa = {"Estatal":"E", "Federal":"F"}
          @nivelregla = {"Municipal":"M", "Estatal":"E", "Federal":"F"}
          @nivelcomite = {"Miembro":"M", "Presidente":"P", "Coordinador":"C"}
        end
end
