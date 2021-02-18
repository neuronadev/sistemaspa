class ValidacionesController < ApplicationController
  include Pagy::Backend
  def index
     #@academicos = Academico.where("red_id=?",current_usuario.persona.academico.red_id)
     idred = Persona.find(current_usuario.persona_id).academico.red_id
     puts idred
     @red = Red.find(idred)
     #activs = Actividad.where("estado='U' or estado='C' or estado='G' and periodo=2020").order(:titulo)
     #activs = Actividad.where("estado !='X' and estado != 'A' and periodo=2020 ").order(:titulo)
     activs = Actividad.where("estado in('U','C','G','D','S','Z') and asignared=#{idred.to_i} and periodo=2020").order(:titulo)
     @data = Hash.new
     #@pagy, @activs = pagy(Actividad.where("estado='U' or estado='C' or estado='G'").order(:titulo), page: params[:page], items: 10)
     red_corr = 0
     i = 0
     activs.each do |a|
        persona = Persona.find(a.personaid)
        if persona.tipopersona_id != 4 
          @data[i]={"id"=>a.id,"personaid"=>a.personaid,"producto"=>a.producto.descripcion,
                             "titulo"=>a.titulo,"estado"=>a.estado}
          i=i+1
        end  
     end
      
   #  activs.each do |a|
   #    pasa = 1 
   #    if a.personaid.present?
   #     persona = Persona.find(a.personaid) 
   #      if persona.tipopersona_id == 4 
   #        pasa = 0
   #      else 
   #        pasa = 1
   #      end
   #    end 
              
   #    if pasa == 1
   #         red_corr = red_corresponsal(a.autores.where("persona_id!=211 and persona_id!=212").order("posicion asc"))
   #         red_primer = 0
   #         pertenece = 0
   #         if red_corr == 0
   #             red_primer = red_primer_autor(a.autores.where("persona_id!=211 and persona_id!=212").order("posicion asc"))
   #             pertenece = red_primer
   #         else
   #           pertenece = red_corr
   #         end
   #         if pertenece == idred
   #           @data[i]={"id"=>a.id,"personaid"=>a.personaid,"producto"=>a.producto.descripcion,
   #                     "titulo"=>a.titulo,"estado"=>a.estado}
   #           i=i+1
   #         end
   #      end    
   #  end
  end

  def red_corresponsal(lista)
    idred = 0
    lista.each do |a|
      if a.corresponsal == 'S'
          p = Persona.find(a.persona_id)
          idred = p.academico.red_id   
      end
    end
    return idred
  end

  def red_primer_autor(lista)
    
    i = 1
    idred = 0
    idpersona = 0
    lista.each do |a|
      if i == 1
         idpersona = a.persona_id 
         puts "::: " + idpersona.to_s
         puts "-------------------------------"
      end 
      i = i+1
    end
    if idpersona > 0
        p = Persona.find(idpersona)
        idred = p.academico.red_id
    end 
   return idred
  end

  def new
    @mensaje = Mensaje.new
  end 
  def mostrar
    idact = params[:id].to_i
    @actividad = Actividad.find(idact)
    if @actividad.estado == 'D'
        @msg = Mensaje.where("actividad_id=? and tipo='N'",idact).order(:created_at)
    end
    if @actividad.estado == 'G'
      @msg = Mensaje.where("actividad_id=? and tipo='C'",idact).order(:created_at)
    end
   
   
  end
 

  def validar
    idactividad = params[:id]
    tipo = params[:tipo]

    actividad = Actividad.find(idactividad)
    actividad.fecha2 = Date.today
    actividad.estado = 'C'
    actividad.save

  end

  def corregir
    idactividad = params[:id]
    @tipo = params[:tipo]
    @actividad = Actividad.find(idactividad)
    @mensaje = Mensaje.new
  end

  def save
     @mensaje = Mensaje.new(mensaje_params)
     @mensaje.save

     idact = params[:mensaje][:actividad_id]
     tipo = params[:mensaje][:tipo]

     actividad = Actividad.find(idact)
     if tipo == 'C'
        actividad.update(estado:'G')
     end   
     if tipo == 'N'
      actividad.update(estado:'D')
     end   
  end

  def consultasa
    @redid = params[:redid]
    @activid = params[:idactiv]
  end

  def dataprod
    
    redid = params[:redid]
    personaid = params[:personaid]
    actividad = nil
    if redid.to_i > 0 && personaid.to_i == 0
      actividad = Actividad.where(:asignared=>redid).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
    end
    if redid.to_i > 0 && personaid.to_i > 0
      idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       actividad = Actividad.where(:id=>idsActiv).where("estado in ('C','S','Z','W')").order(:producto_id).order(:id)
    end
    
    if !actividad.nil?
       render json: { html: render_to_string(partial: 'datared', locals: {items:actividad,red:redid} )}
    else
      render json: { html: 'X' }
    end   
  end

  def datadetalle

    activ_id = params[:id]
    @actividad = Actividad.find(activ_id)

    @listaProds = ''
    Producto.order(:descripcion).each do |p|
      if p.id == @actividad.producto.id
        @listaProds = @listaProds  + "<option value='#{p.id}' selected>#{p.descripcion}</option>"
      else
        @listaProds = @listaProds  + "<option value='#{p.id}'>#{p.descripcion}</option>"
      end
    end
     @lista_aut = ''
     @actividad.autores.order("posicion asc").each do |a|
      if a.persona_id != 211 && a.persona_id != 212
         @lista_aut = @lista_aut + "<option value='#{a.id}'>#{(a.persona.paterno||'')+' '+(a.persona.materno||'')+' '+(a.persona.nombre||'')}</option>"
      end 
      end

    respond_to do |format|
      format.html
      format.js
    end
  end 
  def datamsg
    activ_id = params[:id]
    actividad = Actividad.find(activ_id) 
    persona_marca = ''
    if actividad.estado == 'W'
       Autor.where(:actividad_id=>activ_id).each do |t|
         if t.filiacion == 'F'
             persona = Persona.find(t.persona_id)
             persona_marca = (persona.paterno||'') + ' ' + (persona.materno||'') + ' ' + (persona.nombre||'')
         end
       end
       #persona_marca = " Se aplica al Investigador/Investigadora: " + persona_marca
       persona_marca = ''
    end

    msg = Mensaje.where("actividad_id=? and (tipo='Z' or tipo='W' or tipo='N' or tipo='C' )",activ_id).order(:created_at).last
    @txt = ''
    #msg.each do |m|
              
         @txt = @txt + "<li>"+msg.txt+persona_marca+"</li>" 

    #end
    @txt = "<ul>"+@txt+"</ul>"
     respond_to do |format|
      format.html
      format.js
     end
  end 
  
  def aplicavalsa
    @idactividad = params[:id]
    @accion = 'VAL'
    actividad = Actividad.find(@idactividad.to_i)
    actividad.fecha3 = Date.today
    actividad.estado = 'S'
    actividad.save
    respond_to do |format| 
      format.js
    end
  end

  def aplicavalsamsg
    @idactividad = params[:id]
    @txt = params[:txt]
    @accion = 'VAL'
    actividad = Actividad.find(@idactividad.to_i)
    actividad.fecha3 = Date.today
    actividad.estado = 'S'
    actividad.save
    
    if !@txt.blank? 
      mensaje = Mensaje.create(actividad_id:@idactividad, persona_id: current_usuario.persona_id, tipo:'O', estado:'A', txt:@txt)
    end 

    respond_to do |format| 
      format.js
    end
  end


  def anularcoor
    idactividad = params[:id]
    @actividad = Actividad.find(idactividad)
    @actividad.estado = 'U'
    @actividad.save
    respond_to do |format| 
      format.js
    end
  end

  def anularsa
    idactividad = params[:id]
    @actividad = Actividad.find(idactividad)
    @actividad.estado = 'C'
    @actividad.save

    mensaje = Mensaje.where(actividad_id:idactividad).where(tipo:['Z','O'])
    mensaje.each do |m|
      m.estado = 'X'
      m.save
    end

    respond_to do |format| 
      format.js
    end
  end 

  def rechazar
    @idactividad = params[:id]
    @txt = params[:txt]
    actividad = Actividad.find(@idactividad.to_i)
    actividad.fecha3 = Date.today
    actividad.estado = 'Z'
    actividad.save
    
    mensaje = Mensaje.create(actividad_id:@idactividad, persona_id: current_usuario.persona_id, tipo:'Z', estado:'A', txt:@txt)
    
    respond_to do |format| 
      format.js
    end
  end

  def validacriterio
     actividadid = params[:actividad]
     msg = params[:txt]
     @mensaje = Mensaje.new
     @mensaje.actividad_id = actividadid
     @mensaje.persona_id = current_usuario.persona_id
     @mensaje.tipo = 'Z'
     @mensaje.estado = 'A'
     @mensaje.txt = msg
     @mensaje.save

     idact = actividadid
     actividad = Actividad.find(idact)
     actividad.fecha3 = Date.today
     actividad.update(estado:'Z')  #NO SE CONSIDERA

  end

  def validamarcar
    
    actividadid = params[:actividad]
    msg = params[:txt]
    idautor = params[:idautor]
    
     @mensaje = Mensaje.new
     @mensaje.actividad_id = actividadid
     @mensaje.persona_id = current_usuario.persona_id
     @mensaje.tipo = 'W'  # SE MARCA REGISTRO, SOLO APLICA PARA PRESUPUESTO
     @mensaje.estado = 'A'
     @mensaje.txt = msg
     @mensaje.save

     idact = actividadid
     actividad = Actividad.find(idact)
     actividad.fecha3 = Date.today
     actividad.update(estado:'W') 

     autor = Autor.find(idautor)
     autor.filiacion='F'
     autor.save

  end

  def cambiarprod
    id = params[:actividad]
    prodid = params[:prodid]
    actividad = Actividad.find(id)
    actividad.producto_id = prodid 
    actividad.save

    producto = Producto.find(prodid) 

    render json: { html: producto.descripcion}
  end

  def editdata
    @idact = params[:id]
    @red = params[:red]
    @action = params[:action]
    @actividad = Actividad.find(@idact)
    @producto = Producto.find(@actividad.producto_id) 
    @actividad.autores.order("id asc")
  end
  def updatedata
    id = params[:id]
    red = params[:actividad][:asignared]
    @actividad = Actividad.find(id)
    
    respond_to do |format|
       if @actividad.update(actividad_params)
          flash[:notice] = 'Actualización ok...'
          format.html {redirect_to consultasa_path(red,id)}
          format.js
       else
          flash[:error] = "Error, la información esta incompleta."
          format.html {render :action=>'edit'}
       end   
    end  
  end

  def aceptaval
      idact = params[:id]
      actividad = Actividad.find(idact)
      actividad.aceptado = 'S'
      actividad.faceptado = Date.today
      actividad.save
      redirect_to actividades_path
  end

 def aceptavalsa
      idact = params[:id]
      actividad = Actividad.find(idact)
      actividad.aceptado = 'S'
      actividad.faceptado = Date.today
      actividad.save
      respond_to do |format|
          format.js
      end
  end 



  private def mensaje_params
    params.require(:mensaje).permit(:actividad_id,:persona_id,:tipo,:estado,:txt)
  end
  private def actividad_params
    params.require(:actividad).permit(:titulo,:anio,:producto_id, :personaid,:estado, :fechapub, documentos:[],
         articulo_attributes:[:id,:volumen,:pgini,:pgfin,:revista_id,:actividad_id,:eidentificador],
         libroarbitrado_attributes:[:id,:nopaginas, :idioma_id, :editorial_id, :actividad_id],
         capitulo_attributes: [:id,:pgini,:pgfin,:idioma_id,:libro_id, :actividad_id],
         curso_attributes: [:id,:fini,:ffin,:hcurso,:himpartidas,:creditos,:noalumnos,:coordinador,:tipocurso_id,:actividad_id ],
         tesista_attributes: [:id,:ftermino,:nivelestudio_id,:actividad_id],
         editor_attributes: [:id,:idioma_id,:ambito_id,:codigo,:medio,:editorial,:pais,:actividad_id],
         patente_attributes: [:id,:tipopatente_id,:actividad_id],
         vinculacion_attributes: [:id, :tipovinculacion, :niveldecreto, :ordenamiento, :niveliniciativa, :nivelregla, :nivelcomite, :actividad_id],
         divulgacion_attributes: [:id,:noparticipantes, :nodias,:tipodivulgacion_id, :actividad_id],
         fasciculo_attributes: [:id, :tipofasciculo_id, :tipomedio_id, :nommedio, :codigo, :actividad_id],
         autores_attributes: [:id,:rol_id,:persona_id,:firma,:filiacion,:corresponsal,:posicion,:_destroy] )
   end
end
