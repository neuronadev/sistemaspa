class TecnicoController < ApplicationController
  def index
    @actividades = Persona.find(current_usuario.persona_id).actividades.where("estado!='X'").limit(4).order(created_at: :desc)
    @sust = Sustantiva.where("academico_id=? and estado != 'X'",current_usuario.persona.academico.id).limit(7)
  end

 def sustantiva
  @academico = Academico.new
  #@academico.sustantivas.build
 end 

 def detalle
  @sust = Sustantiva.where("academico_id=? and estado != 'X'",current_usuario.persona.academico.id)
  
  @tot_act = Sustantiva.where("academico_id=? and estado != 'X'",current_usuario.persona.academico.id).count()
  @prom = 0.0
  evaltec = 0.0
  Sustantiva.where("academico_id=? and estado = 'C'",current_usuario.persona.academico.id).each do |s|
   if s.calidad.present? && s.eficiencia.present? 
       evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
   end    
  end
  
  @prom = evaltec.round(2)

 end
 
 def mostraractiv
  idacad = params[:idacad] 
  @sust = Sustantiva.where("academico_id=? and estado != 'X'",idacad)
  
  @tot_act = Sustantiva.where("academico_id=? and estado != 'X'",idacad).count()
  @prom = 0.0
  evaltec = 0.0
  Sustantiva.where("academico_id=? and estado = 'C'",idacad).each do |s|
     if s.calidad.present? && s.eficiencia.present?
        evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
     end 
  end
  
  @prom = evaltec.round(2)
 end

 def mostraradicional
   idacad = params[:idacad] 
   academico = Academico.find(idacad)
   persona = Persona.find(academico.persona_id)

   @actividad = Actividad.where(:personaid=>persona.id).where("estado in ('U','S','Z','W')").order(:producto_id).order(:id)
    
    
 end

 def create
  
  params[:academico][:sustantivas_attributes].each do |item|
     item.each do |r|
        @sust = Sustantiva.create('investigadorid':r['investigadorid'],
                                   'descripcion':r['descripcion'],
                                   'porcentaje':r['porcentaje'],
                                   'academico_id':r['academico_id'])
       if @sust.valid?
           @sust.save
       end  
      
     end 
     #redirect_to sustdetalle_path
  end

 end

 def edit
  sustid = params[:id]
  @action = params[:action]
  @sust = Sustantiva.find(sustid)
 end

 def validar
  idsust = params[:id]
  tipo = params[:tipo]
  sustantiva = Sustantiva.find(idsust)

  if tipo.to_i == 1
     sustantiva.update(estado:'U')
     sustantiva.save
  end   
  if tipo.to_i == 2   
     sustantiva.update(estado:'X')
     sustantiva.save
 end   
 redirect_to sustdetalle_path 
 end

 def updateitem
  idsust = params[:sustantiva][:id]
  sustantiva = Sustantiva.find(idsust)
  sustantiva.update(investigadorid:params[:sustantiva][:investigadorid],
                    descripcion:params[:sustantiva][:descripcion],
                    porcentaje:params[:sustantiva][:porcentaje] 
                   )
  sustantiva.save           
  redirect_to sustdetalle_path      
 end

def listaevaltecnico
   academicos = Academico.all
   tecnicos = Array.new
   @listado = Array.new
   Persona.where(:tipopersona_id=>4).order(:paterno).each do |p|
     tecnicos.push(p.academico.id)
   end
   
   tecnicos.each do |t|
      evaltec = 0.0
      Sustantiva.where("academico_id=? and estado = 'C'",t).each do |s|
         if s.calidad.present? && s.eficiencia.present?
             evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
         end      
      end
      @listado.push([t,evaltec.round(2)])     
   end

end
def tecnicoadetalle
   academicos = Academico.all
   tecnicos = Array.new
   @listado = Array.new
   Persona.where(:tipopersona_id=>4).order(:paterno).each do |p|
     tecnicos.push(p.academico.id)
   end
   
   tecnicos.each do |t|
      evaltec = 0.0
      Sustantiva.where("academico_id=? and estado = 'C'",t).each do |s|
         if s.calidad.present? && s.eficiencia.present?
             evaltec = evaltec + (  (s.porcentaje/100)*(((s.calidad/10)+(s.eficiencia/10))/2)  )
         end      
      end
      if evaltec >= 8.5 
        @listado.push([t,evaltec.round(2)])     
      end  
   end

end


 private def sustantivas_params
  params.require(:academico).permit(sustantivas_attributes:[:id,:investigadorid,:descripcion,:porcentaje,:academico_id,:_destroy])
 end

end
