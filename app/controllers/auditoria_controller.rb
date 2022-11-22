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
      tecnicos.push(p.academico.id)
    end
    
    tecnicos.each do |t|
       evaltec = 0.0
       Sustantiva.where("academico_id=? and estado = 'C' and anio=2021",t).each do |s|
          if s.calidad.present? && s.eficiencia.present?
              evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
          end      
       end
       @listado.push([t,evaltec.round(2)])     
    end 
  end

  def sustantivas
    idacad = params[:id] 
    a = Academico.find(idacad)
    p = Persona.find(a.persona_id)
    @t = (p.paterno||'') + " " + (p.materno||'') + (p.nombre||'')
    @sust = Sustantiva.where("academico_id=? and estado != 'X' and anio=2021",idacad)
    
    @tot_act = Sustantiva.where("academico_id=? and estado != 'X' and anio=2021",idacad).count()
    @prom = 0.0
    evaltec = 0.0
    Sustantiva.where("academico_id=? and estado = 'C' and anio=2021",idacad).each do |s|
      if s.calidad.present? && s.eficiencia.present?
          evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
      end 
    end
    
    @prom = evaltec.round(2)
  end
  
  def adicionales
    academicos = Academico.all
    tecnicos = Array.new
    @listado = Array.new
    Persona.where(:tipopersona_id=>4).order(:paterno).each do |p|
      tecnicos.push(p.academico.id)
    end
    
    tecnicos.each do |t|
       evaltec = 0.0
       Sustantiva.where("academico_id=? and estado = 'C' and anio=2021",t).each do |s|
          if s.calidad.present? && s.eficiencia.present?
              evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
          end      
       end
       @listado.push([t,evaltec.round(2)])     
    end 
  end

  def detalle
    idacad = params[:id]
   
    a = Academico.find(idacad)
    p = Persona.find(a.persona_id) 
  
    #academicos = Academico.all
    tecnicos = Array.new
    @listado = Array.new

    #Persona.where(:id=>p.id).order(:paterno).each do |p|
      tecnicos.push(a.id)
    #end
    
    tecnicos.each do |t|
       evaltec = 0.0
       Sustantiva.where("academico_id=? and estado = 'C' and anio=2021",t).each do |s|
          if s.calidad.present? && s.eficiencia.present?
              evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
          end      
       end
       if evaltec >= 8.5 
         @listado.push([t,evaltec.round(2)])     
       end  
    end
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
       @actividad = Actividad.where(:id=>idsActiv).where("estado in ('S','W') and periodo=2021").order(:producto_id).order(:id)
  end
  
  def cancelados
    @folios = Actividad.where(periodo:2021, estado:['A','C','U','G','D','Z','W','X']).order(:id)
                                                    
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
