class Valactividades::ValidacionesController < ApplicationController
  layout 'validaactividades'
  def index
    
      tipo = params[:tipo]  
      anio = 2021
      @actividades = []
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
          Persona.where(tipopersona_id:[2,4]).order(:paterno).each do |p|
            r = Actividad.where(periodo:2021,estado:['A','C','U']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
            @actividades << [persona:p.id, actividades:r.to_a]
         end
      end 
      
      if tipo == "I" 
        Persona.where(tipopersona_id:2).order(:paterno).each do |p|
            r = Actividad.where(periodo:2021,estado:['A','C','U']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
            @actividades << [persona:p.id, actividades:r.to_a]
         end
      end 
      
      if tipo == "T" 
          Persona.where(tipopersona_id:4).order(:paterno).each do |p|
             r = Actividad.where(periodo:2021,estado:['A','C','U']).includes(:autores).where("autores.persona_id = ?", p.id).references(:autores)
             @actividades << [persona:p.id, actividades:r.to_a]
          end
      end 
  end

  def infoproducto
    @data = params[:data]
    @tr,@idpersona,@idactividad = @data.split('_')

    @actividad = Actividad.find(@idactividad.to_i)
    @producto = @actividad.producto

    if !@producto.pathf.blank? 
        @parts = @producto.pathf.split('-')
    else
        @parts = ['-'] 
    end

    render partial: 'show'
  end
  
end