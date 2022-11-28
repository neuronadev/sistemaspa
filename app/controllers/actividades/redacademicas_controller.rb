class Actividades::RedacademicasController < ApplicationController
  def index
      @p = Persona.find(current_usuario.persona_id)
      @actividades = Actividad.where(estado:['U','C','G','D'],periodo:2022,asignared:@p.academico.red_id).order(:producto_id)
      
      #@academicos = Academico.where(red_id:1)
      #@acad_array = []
      #@academicos.each do |s|
      #   @acad_array.append(s.persona_id)
      #end
      #puts  @acad_array
      #@actividades = Actividad.where(estado:['S'],periodo:2021,asignared:1).order(:producto_id)
      #@actividades = Actividad.includes(:producto).where(periodo:2022,estado:['U']).where(producto_id:[1,2,5,6,7])
      #                .includes(:autores)
      #                  .where('autores.persona_id in (?)', @acad_array ).references(:autores).order("actividades.id")
  end
  def items
     id = params[:id].to_i
     sec = params[:sec]
     @actividad = Actividad.find(id)
     @div_target = "div_#{sec}_#{id.to_s}"
     render partial: 'show'
  end

  def itemaceptar
    id = params[:id].to_i
    sec = params[:sec]
    @actividad = Actividad.find(id)

    valetapa = {actividad_id:@actividad.id, persona_id:current_usuario.persona_id, etapa:'CR', accion:'aceptar', estado:'cerrado', activo:'SI' }

    @v_etapa = create_valetapa valetapa
    update_actividad @actividad, 'C'

    @tr_target = "tr_#{sec}_#{id.to_s}"
    @div_target = "div_#{sec}_#{id.to_s}"
    render partial: 'tabletr'
  end

  def itemcorregir
    id = params[:id].to_i
    @sec = params[:sec]
    @actividad = Actividad.find(id)
    @valetapa = Valetapa.new
    @div_target = "div_#{@sec}_#{id.to_s}"
    render partial: 'divcorregir'
  end
  def itemrechazar
    id = params[:id].to_i
    @sec = params[:sec]
    @actividad = Actividad.find(id)
    @valetapa = Valetapa.new
    @div_target = "div_#{@sec}_#{id.to_s}"
    render partial: 'divrechazar'
  end

  def comentario
    id = params[:id].to_i
    @sec = params[:sec]
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

    @div_target = "div_#{@sec}_#{id.to_s}"
    render partial: "show_mensaje"
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
       actividad.fecha2 = Date.today 
       actividad.save
  end

  def cerrar_activos_valetapa actividad
      Valetapa.where(actividad_id:actividad.id).update_all(activo:'NO')  
  end

end
