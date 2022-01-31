class Valactividades::ValidacionesController < ApplicationController
  layout 'validaactividades'
  
  def index
    
      @tipo = params[:tipo]  
      anio = 2021
      @actividades = []

      if params[:scroll].present?
          @scroll = params[:scroll]
      else 
          @scroll = 0    
      end
      
      if @tipo == "A" 
           @investigadores = Persona.where(tipopersona_id:[2,3], estado:'A').order(:paterno,:materno,:nombre) 
           @tecnicos = Persona.where(tipopersona_id:4, estado:'A').order(:paterno)
           @validados = Persona.where(tipopersona_id:[2,3,4], estado:'A', evaluacion:'S').order(:paterno,:materno,:nombre)
      #    Persona.where(tipopersona_id:[2,4]).order(:paterno).each do |p|
      #      r = Actividad.where(periodo:2021,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
      #      @actividades << [persona:p.id, actividades:r.to_a]
      #   end
      end 
      
      if @tipo == "I" 
        @investigadores = Persona.where(tipopersona_id:[2,3], estado:'A').order(:paterno,:materno,:nombre) 
        Persona.where(tipopersona_id:[2,3]).order(:paterno).each do |p|
            r = Actividad.includes(:producto).where(periodo:2021,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores).order("productos.descripcion")
            @actividades << [persona:p.id, actividades:r.to_a]
        end
      end 
      
      if @tipo == "E" 
        @investigadores = Persona.where(tipopersona_id:[2,3], estado:'A').order(:paterno,:materno,:nombre) 
        Persona.where(tipopersona_id:[2,3]).order(:paterno).each do |p|
            r = Actividad.includes(:producto).where(periodo:2021,estado:['A','C','U','S','G','D'], producto_id:10).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores).order("productos.descripcion")
            @actividades << [persona:p.id, actividades:r.to_a]
        end
      end 
      if @tipo == "V" 
        @investigadores = Persona.where(tipopersona_id:[2,3], estado:'A').order(:paterno,:materno,:nombre) 
        Persona.where(tipopersona_id:[2,3]).order(:paterno).each do |p|
            r = Actividad.includes(:producto).where(periodo:2021,estado:['C','U']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores).order("productos.descripcion")
            @actividades << [persona:p.id, actividades:r.to_a]
        end
      end 
  end

  def listaproductos
    #idacad = params[:idacad].to_i
    persona_p = Persona.find_by_hashid(params[:idacad])
    idacad = persona_p.id
    anio = 2021
    @actividades = []
    @persona_id = idacad
    @tipo = Usuario.where(persona_id:idacad).first.rol
   

    if current_usuario.evaluador == 'A' || current_usuario.evaluador == 'B'  
       #r = Actividad.where(periodo:anio,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", idacad).references(:autores)
       r = Actividad.includes(:producto).where(periodo:anio,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", idacad).references(:autores).order("productos.descripcion")
    end 
    if current_usuario.evaluador == 'C'
       #r = Actividad.where(periodo:anio,estado:['A','C','U','S','G','D'],personaid:idacad).order(:id)
       #r = Actividad.includes(:producto).where(periodo:anio,estado:['A','C','U','S','G','D'],personaid:idacad).order("productos.descripcion")
       r = Actividad.includes(:producto).where(periodo:anio,estado:['A','C','U','S','G','D']).includes(:autores).where("autores.persona_id = ?", idacad).references(:autores).order("productos.descripcion")
    end
    @actividades << [persona:idacad, actividades:r.to_a]
    @periodo_a = Actividad.includes(:producto).where(periodo:2020,estado:'S').includes(:autores).where("autores.persona_id = ?", idacad).references(:autores).order("productos.descripcion")
    @periodo_b = Actividad.where(periodo:2019,estado:'S').includes(:autores).where("autores.persona_id = ?", idacad).references(:autores) 

    if @tipo == 'T'
      @persona = Persona.find(@persona_id.to_i)
      @sustantivas = @persona.academico.sustantivas.where(anio:2021,estado:['A','U','C'])
    end
      
  end

  def listahistorico
    #idacad = params[:idacad]
    persona = Persona.find_by_hashid(params[:idacad])
    idacad = persona.id
    @periodo_a = Actividad.where(periodo:2020,estado:'S').includes(:autores).where("autores.persona_id = ?", idacad).references(:autores)
    @periodo_b = Actividad.where(periodo:2019,estado:'S').includes(:autores).where("autores.persona_id = ?", idacad).references(:autores) 
  end

  def infoproducto
    @trval = params[:trval]

    @tritem = params[:tritem]
    @tr,@idpersona,@idactividad = @trval.split('_')
    @rol = Usuario.where(persona_id:@idpersona.to_i).first.rol     
    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end
    @persona = Persona.find(@idpersona.to_i)
    render partial: 'show'
  end

  def quitarval
    @trval = params[:trval]
    @tritem = params[:tritem]
    @tr,@idpersona,@idactividad = @trval.split('_')

    @actividad = Actividad.find(@idactividad.to_i)
    @actividad.estado='C'  
    @actividad.save

    @rol = Usuario.where(persona_id:@idpersona.to_i).first.rol     
    @producto = @actividad.producto

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end

    @persona = Persona.find(@idpersona.to_i)
    render partial: 'show'
      
  end

  def vbvalidacion
    @trval = params[:target]
    @tritem = params[:item]
    @tr,@idpersona,@idactividad = @trval.split('_')
    @rol = Usuario.where(persona_id:@idpersona.to_i).first.rol     
    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end
    valetapa_t = @actividad.valetapas.where(accion:'rechazar',activo:'SI').last
    valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, 
                etapa:'SA', accion:'rechazar', estado:'cerrado', activo:'SI',
                txtmensaje:valetapa_t.txtmensaje, atendido:'SI' }
    cerrar_activos_valetapa @actividad
    @v_etapa = create_valetapa valetapa
    update_actividad_tecnico_sa @actividad, 'D'
    render partial: "mensaje"
  end

  def aceptarproducto
    @trval = params[:target]
    @tritem = params[:item]
    @tr,@idpersona,@idactividad = @trval.split('_')
    @rol = Usuario.where(persona_id:@idpersona.to_i).first.rol     
    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto
    @persona = Persona.find(@idpersona.to_i)

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end
    
    if @rol != 'T'
       valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, etapa:'SA', accion:'aceptar', estado:'cerrado', activo:'SI' }
       cerrar_activos_valetapa @actividad
       @v_etapa = create_valetapa valetapa
       update_actividad @actividad, 'S'
    else
       if current_usuario.evaluador == 'C'
           valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, etapa:'CM', accion:'aceptar', estado:'cerrado', activo:'SI' }
       end
       if current_usuario.evaluador == 'A'
           valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, etapa:'SA', accion:'aceptar', estado:'cerrado', activo:'SI' }
       end 
       cerrar_activos_valetapa @actividad
       @v_etapa = create_valetapa valetapa
       if current_usuario.evaluador == 'C'
          update_actividad_tecnico @actividad, 'C'
       end
       if current_usuario.evaluador == 'A'
           if @persona.evalua == current_usuario.persona_id
                update_actividad_tecnico @actividad, 'C'
                update_actividad_tecnico_sa @actividad, 'S'
           else
                update_actividad_tecnico_sa @actividad, 'S'
           end
       end   
    end

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

   

    m = @actividad.valetapas.where(accion:'rechazar', activo:'SI').last
    if m.nil?
       @valetapa.txtmensaje = ''
    else      
       @valetapa.txtmensaje = m.txtmensaje
    end
    
    render partial: 'rechazarproducto'
  end

  def comentario
      id = params[:id].to_i
      @trval = params[:target]
      @tritem = params[:item]
      @tr,@idpersona,@idactividad = @trval.split('_')
      @rol = Usuario.where(persona_id:@idpersona.to_i).first.rol     
      @actividad = Actividad.find(id)

      
             valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, 
                        etapa:params[:etapa], accion:params[:tipo], estado:params[:estado], activo:params[:activo],
                        txtmensaje:params[:valetapa][:txtmensaje], atendido:params[:atendido] }
             cerrar_activos_valetapa @actividad
             @v_etapa = create_valetapa valetapa

             @persona = Persona.find(@idpersona.to_i)

             if @rol != 'T'  
                  if params[:tipo] == 'corregir' 
                    update_actividad @actividad, 'G'
                  end
                  if params[:tipo] == 'rechazar' 
                    update_actividad @actividad, 'D'
                  end
               else
                  if params[:tipo] == 'corregir' 
                      update_actividad_tecnico @actividad, 'G'
                  end
                  if params[:tipo] == 'rechazar' 
                      if current_usuario.evaluador == 'C'
                          update_actividad_tecnico @actividad, 'D'
                      end
                      if current_usuario.evaluador == 'A'
                          if @persona.evalua == current_usuario.persona_id 
                                update_actividad_tecnico @actividad, 'D'
                                update_actividad_tecnico_sa @actividad, 'D'
                          else 
                              update_actividad_tecnico_sa @actividad, 'D'
                          end
                    end
                  end
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
                @academicos << [persona:p.id, porcentaje:porcentajetotal, calificacion:calif, sustantivas:p.academico.sustantivas.where(anio:2021,estado:['A','U','C'])]
            else
                 @academicos << [persona:p.id, porcentaje:0.0, calificacion:0.0, sustantivas:nil]      
            end    
         end 
      end
 end 

 def sustantivas
     #personaid = params[:personaid]
     persona = Persona.find_by_hashid(params[:personaid])
     personaid = persona.id
     @persona = Persona.find(personaid.to_i)
     @sustantivas = @persona.academico.sustantivas.where(anio:2021,estado:['A','U','C'])


 end

 def academicook
   trval = params[:persona]
   tr,idpersona = trval.split('_') 
   persona = Persona.find(idpersona.to_i)
   persona.evaluacion = 'S'
   persona.save
   @validados = Persona.where(tipopersona_id:[2,3,4], estado:'A', evaluacion:'S').order(:paterno,:materno,:nombre)
   render partial: 'list_ok'
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
  def update_actividad_tecnico actividad, estado
    actividad.edoblur = estado
    actividad.fecha2 = Date.today 
    actividad.save
   end
   def update_actividad_tecnico_sa actividad, estado
    actividad.edoblur = estado
    actividad.fecha3 = Date.today 
    actividad.save
   end

  def cerrar_activos_valetapa actividad
      Valetapa.where(actividad_id:actividad.id).update_all(activo:'NO')  
  end

end