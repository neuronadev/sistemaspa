class AuditoriaController < ApplicationController
  before_action :authenticate_usuario!
   layout 'auditoria'
  def index
  end

  def evaluacion
    academicos = Academico.all
    tecnicos = Array.new
    @listado = Array.new
    Persona.where(:tipopersona_id=>4).order(:paterno).each do |p|
      tecnicos.push(p.id)
    end
    
    tecnicos.each do |t|
        cal_final = 0.0
        Evaltecnico.where(persona_id: t, anio:2022).each do |s|
            s.itemsustantivas.each do |item| 
                  porcentaje = item.porcentaje
                  calidad = 0.0
                  eficiencia = 0.0
                  cal_item = 0.0
                  if item.calificaciones.any?
                        calidad = !item.calificaciones.where(tipo:'CA').first.nil? ?  item.calificaciones.where(tipo:'CA').first.calificacion : 0.0
                        eficiencia = !item.calificaciones.where(tipo:'EF').first.nil? ?  item.calificaciones.where(tipo:'EF').first.calificacion : 0.0
                  end  
                  cal_item = (porcentaje.to_f/100) * ((calidad/10) + (eficiencia/10))/2
                  cal_final += cal_item
            end
        end
        @listado.push([t, cal_final.round(2)])
    end 

  end

  def sustantivas
    idacad = params[:id] 
    a = Academico.find(idacad)
    p = Persona.find(a.persona_id)
    
    @t = (p.paterno||'') + " " + (p.materno||'') + (p.nombre||'')

    @sust = Evaltecnico.where(persona_id: p.id, anio:2022).first
    @tot_act = @sust.itemsustantivas.count

    @prom = 0.0
    evaltec = 0.0

        @sust.itemsustantivas.each do |item| 
            porcentaje = item.porcentaje
            calidad = 0.0
            eficiencia = 0.0
            cal_item = 0.0
            if item.calificaciones.any?
                 calidad = !item.calificaciones.where(tipo:'CA').first.nil? ?  item.calificaciones.where(tipo:'CA').first.calificacion : 0.0
                 eficiencia = !item.calificaciones.where(tipo:'EF').first.nil? ?  item.calificaciones.where(tipo:'EF').first.calificacion : 0.0
            end  
            cal_item = (porcentaje.to_f/100) * ((calidad/10) + (eficiencia/10))/2
            evaltec += cal_item
        end
    
      @prom = evaltec.round(2)
  end
  
  def adicionales
    academicos = Academico.all
    tecnicos = Array.new
    @listado = Array.new
    Persona.where(:tipopersona_id=>4).order(:paterno).each do |p|
      tecnicos.push(p.id)
    end
    
    tecnicos.each do |t|
       cal_final = 0.0
       Evaltecnico.where(persona_id: t, anio:2022).each do |s|
            s.itemsustantivas.each do |item| 
                  porcentaje = item.porcentaje
                  calidad = 0.0
                  eficiencia = 0.0
                  cal_item = 0.0
                  if item.calificaciones.any?
                        calidad = !item.calificaciones.where(tipo:'CA').first.nil? ?  item.calificaciones.where(tipo:'CA').first.calificacion : 0.0
                        eficiencia = !item.calificaciones.where(tipo:'EF').first.nil? ?  item.calificaciones.where(tipo:'EF').first.calificacion : 0.0
                  end  
                  cal_item = (porcentaje.to_f/100) * ((calidad/10) + (eficiencia/10))/2
                  cal_final += cal_item
            end
       end
       @listado.push([t, cal_final.round(2)])
    end 

  end

  def detalle
    idacad = params[:id]
   
    a = Academico.find(idacad)
    p = Persona.find(a.persona_id) 
    evaltec = 0.0
    @listado = Array.new

       cal_final = 0.0
       Evaltecnico.where(persona_id: p.id, anio:2022).each do |s|
            s.itemsustantivas.each do |item| 
                  porcentaje = item.porcentaje
                  calidad = 0.0
                  eficiencia = 0.0
                  cal_item = 0.0
                  if item.calificaciones.any?
                        calidad = !item.calificaciones.where(tipo:'CA').first.nil? ?  item.calificaciones.where(tipo:'CA').first.calificacion : 0.0
                        eficiencia = !item.calificaciones.where(tipo:'EF').first.nil? ?  item.calificaciones.where(tipo:'EF').first.calificacion : 0.0
                  end  
                  cal_item = (porcentaje.to_f/100) * ((calidad/10) + (eficiencia/10))/2
                  cal_final += cal_item
            end
       end

    @listado.push([idacad, cal_final.round(2)])          
  end


  def adicionalesinv
      @personas = Persona.where(tipopersona_id:[2,3]).order(:paterno)
  end

  def listaadicinv
    personaid = params[:id]
    @persona = Persona.find(personaid)
    @nombrc = (@persona.paterno||'') + ' ' + (@persona.materno||'') + ' ' + (@persona.nombre||'')
    idsActiv = Array.new
      Autor.where(:persona_id=>personaid).each do |a|
         idsActiv.push(a.actividad_id) 
      end
       @actividad = Actividad.where(:id=>idsActiv).where("estado in ('S','W') and periodo=2022").order(:producto_id).order(:id)
  end
  
  def cancelados
    @folios = Actividad.where(periodo:2022, estado:['A','C','U','G','D','Z','W','X']).order(:id)
                                                    
  end

  def downother
    key = params[:id]
    tipo = params[:tipo]
   
    if tipo == 'C' 
     path = "/home/deploy/documentos/ccursos/" + key + ".pdf"
    end
    if tipo == 'T' 
      path = "/home/deploy/documentos/ctesis/" + key + ".pdf"
     end
    if File.file?(path)
        send_file path, disposition: 'inline', content_type: "application/pdf"  
    end

  end

end
