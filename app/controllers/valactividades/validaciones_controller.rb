class Valactividades::ValidacionesController < ApplicationController
  layout 'validaactividades'
  def index
    
      tipo = params[:tipo]  
      anio = 2021
      @actividades = ''
      invest = [] 
      tecs = []

      Usuario.where(rol:'I').each do |u|
        if u.persona.estado == 'A'
            invest << u.persona_id
        end  
      end
      Usuario.where(rol:'T').each do |u|
        if u.persona.estado == 'A'
            tecs << u.persona_id
        end  
      end

      if tipo == "A" 
          @actividades = Actividad.where(estado:'C', periodo:anio).order(:id)
      end 
      
      if tipo == "I" 
          @actividades = Actividad.where(estado:'C', periodo:anio, personaid:invest).order(:id)
      end 
      
      if tipo == "T" 
          @actividades = Actividad.where(estado:'C', periodo:anio, personaid:tecs).order(:id)
      end 

  end
end
