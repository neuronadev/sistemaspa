class ApplicationController < ActionController::Base
     

     before_action :select_layout
     layout :select_layout
    
     def select_layout_comite
          if @datos_academico_ints.comite.rol == 'ADM'
                "revisores/administrador"
          end             
     end

     protected def select_layout
         
         

         if !current_usuario.nil?

               @datos_academico_ints = current_usuario.persona.datosAcademico

               ambitos_select  
               if current_usuario.rol == 'S'
                    "administrar"
               elsif current_usuario.rol == 'I'
                    "investigador"
               elsif current_usuario.rol == 'C'
                    "investigador"
               elsif current_usuario.rol == 'T'
                    "tecnico"
               elsif current_usuario.rol == 'Y'
                    #"system"     
                    "investigador"
               else
                    "application"
               end
          end      
     end

      private def ambitos_select
          @usuario_nom =  (current_usuario.persona.nombre) + " " + (current_usuario.persona.paterno||'')
          @especializada = {"SI":"S", "NO":"N"}
          @corresponsal = {"NO":"N", "SI":"S"}
          @niveldecreto = {"Municipal":"M", "Estatal":"E", "Federal":"F"}
          @ordenamiento = {"Aceptado":"A", "Publicado":"P"}
          @niveliniciativa = {"Estatal":"E", "Federal":"F"}
          @nivelregla = {"Municipal":"M", "Estatal":"E", "Federal":"F"}
          @nivelcomite = {"Miembro":"M", "Presidente":"P", "Coordinador":"C"}
        end
end
