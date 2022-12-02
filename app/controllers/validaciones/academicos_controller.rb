class Validaciones::AcademicosController < ApplicationController
    layout "/validacion/academico"
    def index
        
        @tecnicos = Persona.where(evalua:current_usuario.persona_id ).where.not(estado:'B').order(:paterno)
    end
    def adicionales
        @adicionales = Actividad.includes(:producto).where(periodo:2022,estado:['A','U','C','S','G','D'])
                      .includes(:autores)
                      .where('autores.persona_id = ?', params[:idacad] ).references(:autores).order("productos.descripcion")
                      
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
end
