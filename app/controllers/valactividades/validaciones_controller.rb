class Valactividades::ValidacionesController < ApplicationController
  layout 'validaactividades'
  def index
    
      @tipo = params[:tipo]  
      anio = 2021
      @actividades = []

      if @tipo == "A" 
          Persona.where(tipopersona_id:[2,4]).order(:paterno).each do |p|
            r = Actividad.where(periodo:2021,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
            @actividades << [persona:p.id, actividades:r.to_a]
         end
      end 
      
      if @tipo == "I" 
        Persona.where(tipopersona_id:[2,3]).order(:paterno).each do |p|
            r = Actividad.where(periodo:2021,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
            @actividades << [persona:p.id, actividades:r.to_a]
         end
      end 
      
      if @tipo == "T" 
          Persona.where(tipopersona_id:4).order(:paterno).each do |p|
             r = Actividad.where(periodo:2021,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
             @actividades << [persona:p.id, actividades:r.to_a]
          end
      end 
  end

  def infoproducto
    @trval = params[:trval]
    @tritem = params[:tritem]
    @tr,@idpersona,@idactividad = @trval.split('_')

    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end

    render partial: 'show'
  end

  def aceptarproducto
    @trval = params[:target]
    @tritem = params[:item]
    @tr,@idpersona,@idactividad = @trval.split('_')

    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end

    valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, etapa:'SA', accion:'aceptar', estado:'cerrado', activo:'SI' }
    cerrar_activos_valetapa @actividad
    @v_etapa = create_valetapa valetapa
    update_actividad @actividad, 'S'

    render partial: 'aceptarproducto'
  end
  
  def corregirproducto
    @trval = params[:target]
    @tritem = params[:item]
    @tr,@idpersona,@idactividad = @trval.split('_')

    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto
    @valetapa = Valetapa.new

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end
       render partial: 'corregirproducto' 
  end

  def rechazarproducto
    @trval = params[:target]
    @tritem = params[:item]
    @tr,@idpersona,@idactividad = @trval.split('_')

    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto
    @valetapa = Valetapa.new
    render partial: 'rechazarproducto'
  end

  def comentario
      id = params[:id].to_i
      @trval = params[:target]
      @tritem = params[:item]
      @actividad = Actividad.find(id)
      valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, 
                etapa:params[:etapa], accion:params[:tipo], estado:params[:estado], activo:params[:activo],
                txtmensaje:params[:valetapa][:txtmensaje], atendido:params[:atendido] }
      cerrar_activos_valetapa @actividad
      @v_etapa = create_valetapa valetapa
      if params[:tipo] == 'corregir' 
        update_actividad @actividad, 'G'
      end
      if params[:tipo] == 'rechazar' 
        update_actividad @actividad, 'D'
      end
      render partial: "mensaje"
  end

 def evaluacion
      @academicos = []
      Persona.where(tipopersona_id:4,estado:'A').order(:paterno).each do |p|
         if !p.academico.nil?
            if !p.academico.sustantivas.where(anio:2021,estado:['A','U','C']).nil? 
                porcentajetotal = p.academico.sustantivas.where(anio:2021,estado:['A','U','C']).sum(:porcentaje)
                calif = 0.0.to_f
                p.academico.sustantivas.where(anio:2021,estado:['A','U','C']).each do |s|
                    if s.estado == 'C'  
                            calidad =  !s.calidad.nil? ? s.calidad : 0.0
                            eficiencia = !s.eficiencia.nil? ? s.eficiencia : 0.0
                            calif = calif + (  (s.porcentaje/100)*(((calidad/10)+(eficiencia/10))/2)  )
                    end     
                end
                @academicos << [persona:p.id, porcentaje:porcentajetotal, calificacion:calif, sustantivas:p.academico.sustantivas.where(anio:2021,estado:['A','U','C']).to_a]
            else
                 @academicos << [persona:p.id, porcentaje:0.0, calificacion:0.0, sustantivas:[]]      
            end    
         end 
      end
 end 

 def sustantivas
     
 end

  private
  def create_valetapa obj
      
      params = ActionController::Parameters.new({
           valetapa:obj
      })
      
      permitted = params.require(:valetapa).permit(:actividad_id, :persona_id, :etapa, :accion, :estado, :activo, :txtmensaje, :atendido)
      v = Valetapa.new(permitted)
      v.save 
      return v
  end
  
  def update_actividad actividad, estado
       actividad.estado = estado
       actividad.fecha3 = Date.today 
       actividad.save
  end

  def cerrar_activos_valetapa actividad
      Valetapa.where(actividad_id:actividad.id).update_all(activo:'NO')  
  end

end