class Validaciones::AcademicosController < ApplicationController
    layout "/validacion/academico"
    def index
        
        @tecnicos = Persona.where(evalua:current_usuario.persona_id ).where.not(estado:'B').order(:paterno)
    end
    def adicionales
        @academico = Persona.find(params[:idacad])
        @adicionales = Actividad.includes(:producto).where(periodo:2022,estado:['A','U','C','S','G','D'])
                      .includes(:autores)
                      .where('autores.persona_id = ?', params[:idacad] ).references(:autores).order("actividades.titulo")
        @sustantivas = Evaltecnico.where(persona_id:params[:idacad]).first
        render partial: "adicionales"
    end
    def producto
        @actividad = Actividad.find(params[:idprod].to_i)
        @producto = @actividad.producto

        if !@producto.pathf.blank? 
             @parts = @producto.pathf.split('-')
        else
             @parts = ['-'] 
       end

        render partial: "producto"

    end
    def validar
        @actividad = Actividad.find(params[:idprod].to_i)
        @tipo = params[:tipo]
        
        if @tipo == 'E'
            @valacademico = Valetapa.new
        end

        render partial: "validar"
    end
    def aplicartipo
        @actividad = Actividad.find(params[:idprod].to_i)
        @tipo = params[:tipo]

        if @tipo == 'A'
            @actividad.estado = 'C'
            @actividad.save
        end

        render partial: "mensaje_val"

    end
    def mensaje
   
        @actividad = Actividad.find(params[:id].to_i) 

        @valetapa = Valetapa.new
        @valetapa.actividad_id = params[:id]
        @valetapa.persona_id = params[:persona_id]
        @valetapa.etapa = params[:etapa]
        @valetapa.accion = params[:tipo]
        @valetapa.estado = params[:estado]
        @valetapa.atendido = params[:atendido]
        @valetapa.activo = params[:activo]
        @valetapa.txtmensaje = params[:txtmensaje]
        @valetapa.save
 
        if  params[:tipo] == 'corregir'
            @actividad.estado = 'G'
            @actividad.save
        end
        if  params[:tipo] == 'rechazar'
            @actividad.estado = 'D'
            @actividad.save
        end

        respond_to do |format| 
           format.js
        end   
    end
  

   

end
