class ActividadesController < ApplicationController
  include Pagy::Backend
  def index
     @persona = Persona.find(current_usuario.persona_id)
     #@actividades = Persona.find(current_usuario.persona_id).actividades.where("estado!='X'").order(:titulo)
     #@pagy, @actividades = pagy(Persona.find(current_usuario.persona_id).actividades.where("estado!='X' and estado!='H' ").order(:titulo), page: params[:page], items: 20)
     @pagy, @actividades = pagy(Persona.find(current_usuario.persona_id).actividades.where("periodo=2020 and (estado!='X' and estado!='H')").order(:titulo), page: params[:page], items: 20)
  end

  def filtro
   grupo = params[:tipo].to_i

   if grupo == 1
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("(estado!='X' and estado!='H) and producto_id in(1,5,2,3,4)").order(:titulo)
   end
   if grupo == 2
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("(estado!='X' and estado!='H) and producto_id in(6,7,12,11)").order(:titulo)
   end
   if grupo == 3
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("(estado!='X' and estado!='H) and producto_id in(8,22,39)").order(:titulo)
   end

  end

  def new
       
    @actividad = Actividad.new
    @actividad.autores.build
    
    #@actividad.build_articulo

  end
  def newact
    @idactividad_ant = params[:idanterior]
    producto_id = params[:producto_id]
    @action = params[:action]
    @producto = Producto.find(producto_id) 
    @disabled = false
    @metodo = "" 

    @actividad = Actividad.new
    @actividad.autores.build
    @actividad.build_articulo
    @actividad.build_libroarbitrado
    @actividad.build_capitulo
    @actividad.build_curso
    @actividad.build_tesista
    @actividad.build_editor
    @actividad.build_patente
    @actividad.build_vinculacion
    @actividad.build_divulgacion
    @actividad.build_fasciculo
  end

  def create
    @actividad = Actividad.new(actividad_params) 
    @action = params[:action]
    respond_to do |format| 
        if @actividad.save
           flash[:notice] = 'Registro realizado correctamente'
           format.html {redirect_to actividad_path(@actividad.id)}
           format.js
           #puts "Ok, Saved.."
           #redirect_to actividad_path(@actividad.id)
        end
    end    
  end

  def show
     idact = params[:id]
     @action = params[:action]
     @metodo = "show" 
     @disabled = true
     @actividad = Actividad.find(idact)
     @producto = Producto.find(@actividad.producto_id) 
  end

  def edit
    idact = params[:id]
    @action = params[:action]
    @actividad = Actividad.find(idact)
    @producto = Producto.find(@actividad.producto_id) 
    @actividad.autores.order("id asc")
     
  end

  def update
    id = params[:id]
    @actividad = Actividad.find(id)
    
    respond_to do |format|
       if @actividad.update(actividad_params)
          flash[:notice] = 'Actualización ok...'
          if current_usuario.rol == 'T'
             @actividad.estado='U'
          else  
            @actividad.estado='C'
          end   
            @actividad.save
          
          format.html {redirect_to actividades_path}
          #format.html {redirect_to editarindex_path(0,0)}
          format.js
       else
          flash[:error] = "Error, la información esta incompleta."
          format.html {render :action=>'edit'}
       end   
    end  
  end

  def destroy
    idact = params[:id]
    actividad = Actividad.find(idact)
    actividad.estado = 'X'
    actividad.save
    redirect_to actividades_path
  end
 
  def historico
    anio = params[:anio]
    @productos = Historico.where("anio=?",anio.to_i).order(:producto)
  end

    # A = Activo, capturaod por el usuario U = validado por el usuario  C = Validado por el coordiador de red
    # S = Validado por la SA  X = Eliminado
  def validar
    idact = params[:id]
    tipo = params[:tipo] # (U)suario (C)oordinador (S)ecret Acad
    actividad = Actividad.find(idact)
    if tipo == 'user' 
       actividad.estado = 'U'
       actividad.fecha1 = Date.today
    end   
    if tipo == 'coor' 
      actividad.estado = 'C'
      actividad.fecha2 = Date.today
   end   
   if tipo == 'sa' 
    actividad.estado = 'S'
    actividad.fecha3 = Date.today
  end   
  
  actividad.save

   redirect_to actividades_path

  end

  def deldoc
    @iddoc = params[:id]
    attachment = ActiveStorage::Attachment.find(@iddoc)
    attachment.purge
  end

   def evaltecnico
      @sustantivas = Sustantiva.where("investigadorid=? and (estado='U' or estado='C') and anio=2020",current_usuario.persona_id).order(:academico_id)
   end

   def cuestionario
     @idacad = params[:idacad]
     @tipo = params[:tipo]
     @idact = params[:idact] 
     @sustantiva = Sustantiva.find(@idact)
     @academico = Academico.find(@idacad)
   end 
   def svcuestionario
    data = params[:data]
    idact = params[:idact]
    tipo = params[:tipo]
    reactivos = 25
    suma = 0.0
    califica = 0.0

    hash = JSON(data)
    hash.each do |c,v|
      if v != 'na'
         suma = suma + v.to_i
      else
        reactivos = reactivos-1
      end
    end

    califica = (suma/reactivos)*10
    
    sustantiva = Sustantiva.find(idact) 
      if tipo.to_i == 1
       sustantiva.quizcalidad = data
       sustantiva.calidad = califica
       sustantiva.estado = 'C'
       sustantiva.save 
      end  
      if tipo.to_i == 2
        sustantiva.quizeficiencia = data
        sustantiva.eficiencia = califica
        sustantiva.estado = 'C'
        sustantiva.save 
       end  
 
    respond_to do |format|
      format.json {render json: 'saved'.to_json}
    end
   end

   def presupuesto
    @lista = Presupuesto.all.order(:numero)
   end


  private def actividad_params
   params.require(:actividad).permit(:titulo,:anio,:producto_id, :personaid,:estado, :fechapub, :reemplazaidact, :periodo, :asignared, documentos:[],
        articulo_attributes:[:id,:volumen,:pgini,:pgfin,:revista_id,:actividad_id,:eidentificador,:doi],
        libroarbitrado_attributes:[:id,:nopaginas, :idioma_id, :editorial_id, :actividad_id],
        capitulo_attributes: [:id,:pgini,:pgfin,:idioma_id,:libro_id, :actividad_id],
        curso_attributes: [:id,:fini,:ffin,:hcurso,:himpartidas,:creditos,:noalumnos,:coordinador,:tipocurso_id,:actividad_id ],
        tesista_attributes: [:id,:ftermino,:nivelestudio_id,:actividad_id],
        editor_attributes: [:id,:idioma_id,:ambito_id,:codigo,:medio,:editorial,:pais,:actividad_id],
        patente_attributes: [:id,:tipopatente_id,:actividad_id],
        vinculacion_attributes: [:id, :tipovinculacion, :niveldecreto, :ordenamiento, :niveliniciativa, :nivelregla, :nivelcomite, :actividad_id],
        divulgacion_attributes: [:id,:noparticipantes, :nodias,:tipodivulgacion_id, :actividad_id],
        fasciculo_attributes: [:id, :tipofasciculo_id, :tipomedio_id, :nommedio, :codigo, :actividad_id],
        autores_attributes: [:id,:rol_id,:persona_id,:firma,:filiacion,:corresponsal,:posicion,:porcentaje,:_destroy] )
  end

end
