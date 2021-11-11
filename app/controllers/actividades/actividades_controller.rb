class Actividades::ActividadesController < ApplicationController
  before_action :authenticate_usuario!

  def index
    #@actividades = Actividad.where(periodo:2021,estado:['A','U','C','S','G','D']).includes(:autores).where('autores.persona_id = ?', current_usuario.persona_id ).references(:autores)
    
    @actividades = Actividad.where(periodo:2021,estado:['A','U','C','S','G','D']).where.not(producto_id:[22,39,82,83])
                      .includes(:autores)
                        .where('autores.persona_id = ?', current_usuario.persona_id ).references(:autores)
    @enlace = Actividad.where(periodo:2021,estado:['A','U','C','S','G','D']).where(producto_id:[22,39])
                        .includes(:autores)
                          .where('autores.persona_id = ?', current_usuario.persona_id ).references(:autores)
    @posgrado = Actividad.where(periodo:2021,estado:['A','U','C','S','G','D']).where(producto_id:[82,83])
                          .includes(:autores)
                            .where('autores.persona_id = ?', current_usuario.persona_id ).references(:autores)
     


  end

  def show
    @actividad = Actividad.find(params[:id].to_i)
    @producto = @actividad.producto
    if !@producto.pathf.blank? 
      @parts = @producto.pathf.split('-')
   else
     @parts = ['-'] 
   end
  end

  def new
   
    @producto = Producto.find(params[:item].to_i)
   
    if !@producto.pathf.blank? 
       @parts = @producto.pathf.split('-')
    else
      @parts = ['-'] 
    end
    @actividad = Actividad.new
    @actividad.build_articulo
    @actividad.autores.build
    @actividad.build_libroarbitrado
    @actividad.build_capitulo
    @actividad.build_fasciculo
    @actividad.build_patente
    @actividad.build_editor
    @actividad.build_divulgacion
    @actividad.build_vinculacion
    @actividad.build_curso
    @actividad.build_tesista
  end

  def create
    @actividad = Actividad.new(actividad_params)
    @producto = @actividad.producto
   
    if @actividad.valid?
        if @actividad.autores.present? 
           if @actividad.documentos.present? 
               @actividad.save
               redirect_to [:actividades, @actividad]
           else
               @actividad.errors.add(:documentos,"Se requiere el comprobante")  
           end    
        else
            @actividad.errors.add(:autores,"Se requiere los participantes")
        end    
     end
     @producto = Producto.find(@actividad.producto_id)
     !@producto.pathf.blank?  ? @parts = @producto.pathf.split('-') : @parts = ['-'] 
     
     respond_to do |format|
         format.js
     end
       #render :new
  end

  def edit
    @actividad = Actividad.find(params[:id].to_i)
    @producto = @actividad.producto
    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end
    
  end

  def update
    @actividad = Actividad.find(params[:id].to_i)

    if @actividad.update(actividad_params)
          redirect_to [:actividades, @actividad]  
    else
          @producto = @actividad.producto  
          if !@producto.pathf.blank? 
               @parts = @producto.pathf.split('-')
          else
               @parts = ['-'] 
          end 
          respond_to do |format|
              format.js
          end 
     end
  end

  def updoc
     @actividad = Actividad.find(params[:id].to_i)  
  end

  def savedoc
    @actividad = Actividad.find(params[:id])
     if params[:actividad].present? 
        params[:actividad][:documentos].each do |doc| 
          @actividad.documentos.attach(doc)
          flash[:msgupdoc] = "El documento se anexo correctamente al producto académico."
        end 
        redirect_to [:actividades,@actividad]
     else
       render :updoc
     end
  
  end  

  def destroy
      @actividad = Actividad.find(params[:id].to_i)
      @actividad.estado = 'X'
      @actividad.save
     
      
      redirect_to actividades_actividades_path
  end

  private
  
  def actividad_params
      params.require(:actividad).permit(
          :titulo, :anio, :producto_id, :personaid, :estado, :fechapub,
          :asignared, :fuente, :periodo, documentos:[],
          articulo_attributes:[:id,:volumen,:pgini,:pgfin,:revista_id,:actividad_id,:eidentificador,:doi,:issue,:abstract],
          libroarbitrado_attributes:[:id,:nopaginas, :idioma_id, :editorial_id,:isbn, :actividad_id],
          capitulo_attributes: [:id,:pgini,:pgfin,:idioma_id,:libro_id, :actividad_id],
          patente_attributes: [:id,:tipopatente_id,:actividad_id],
          vinculacion_attributes: [:id, :tipovinculacion, :niveldecreto, :ordenamiento, :niveliniciativa, :nivelregla, :nivelcomite, :actividad_id],
          divulgacion_attributes: [:id,:noparticipantes, :nodias,:tipodivulgacion_id, :actividad_id],
          fasciculo_attributes: [:id, :tipofasciculo_id, :tipomedio_id, :nommedio, :codigo, :actividad_id],
          curso_attributes:[:id, :fini,:ffin, :hcurso, :himpartidas, :creditos, :noalumnos, :actividad_id, :coordinador, :tipocurso_id],
          tesista_attributes:[:id,:ftermino,:nivelestudio_id,:actividad_id, :fgrado, :efterminal, :acta],
          editor_attributes: [:id,:tipoeditorid,:idioma_id,:ambito_id,:codigo,:medio,:editorial,:pais,:actividad_id],
          autores_attributes: [:id,:rol_id,:persona_id,:firma,:corresponsal, :actividad_id, :_destroy]

      )
  end

end
