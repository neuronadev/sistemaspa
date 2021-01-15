class ConsultasController < ApplicationController
  layout 'consultas'

  def index
  end

  def historicop
    idpersona = params[:idacad]
    tipo = params[:tipoc]
   
    #2018
      ids_pub = Array.new 
      ids_activp = Array.new 
      actual_persona  = Persona.find(idpersona)

      if  actual_persona.cruid != 0 &&  !actual_persona.cruid.nil?
        @persona = Hpersona.find(actual_persona.cruid)
        #####
        autor = Hautor.select(:publicacion_id).distinct.where(:persona_id=>@persona.id)
        autor.each do |p|
          ids_pub.push(p.publicacion_id)
        end
        @items_pub = Hpublicacion.where(:id=>ids_pub).where("estado='O'").order(:id)
        #####
        @items_activ = Hactividad.where(:reporta=>@persona.id).where("estado='O'").order(:id)
        #####
        autor = nil
        autor = Hautor.where({persona_id:@persona.id}).where("actividad_id > 0")
        autor.each do |p|
          ids_activp.push(p.actividad_id)
        end
        @items_activp = Hactividad.where(:id=>ids_activp).where("estado='O'").order(:id)
        ##### 
      else
        @persona = actual_persona
        @items_pub = []
        @items_activ = []
        @items_activp = []
      end
    #2017 
      @actividades = Historico.where(:persona_id=>idpersona)
    #render json: { html: render_to_string(partial: 'condata', locals: {items_pub:@items_pub,items_activ:@items_activ,items_activp:@items_activp,persona:@persona,actividades:@actividades} )}
  
    #2019
      @act19 = Persona.find(idpersona).actividades.where("estado='S' and aceptado='S' and periodo=2019").order(:titulo)
    #  render json: { html: render_to_string(partial: 'condata', locals: {items_pub:@items_pub,items_activ:@items_activ,items_activp:@items_activp,persona:@persona,actividades:@actividades, act19:@act19} )}
  end
end
