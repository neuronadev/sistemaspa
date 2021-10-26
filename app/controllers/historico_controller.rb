class HistoricoController < ApplicationController
  before_action :authenticate_usuario!
    def datahistory
       @periodo = params[:periodo].to_i
       @actividades = Persona.find(current_usuario.persona_id).actividades.where(:periodo=>@periodo).where("estado='S' or estado='W'").order(:titulo)
       #@actividad = Actividad.where(:periodo=>periodo).where("estado='S' or estado='W'")
    end
    #layout "historico"
    def consultar
        #2018
        ids_pub = Array.new 
        ids_activp = Array.new 
        actual_persona  = Persona.find(current_usuario.persona_id)
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
        #2018 capturados en 2019
        @items_h = Actividad.where(:estado=>'H')
        #####


    end
    def comprobante
      #2018
      key_des = params[:key]
      path = "/home/deploy/comprobante" + "/" + key_des[0,2] + "/" + key_des[2,2] + "/" + key_des
      send_file path, disposition: 'inline', content_type: "application/pdf"
      
    end
    def datahistorico
      #2017 
      @actividades = Historico.where(:persona_id=>current_usuario.persona_id)
      #2017 capturados en 2019
      @items_h = Actividad.where(:estado=>'H')
      #####
    end

    def histgeneral
        @str_noms = "<option vaues='0' selected>--Seleccione un investigador--</option>"
        Persona.where("tipopersona_id in (2,3)").order(:paterno).each do |p|
          @str_noms = @str_noms + "<option value='#{p.id}'>#{(p.paterno||'') + ' ' + (p.materno||'') + ' ' + (p.nombre||'')}</option>"
        end
    end

    def datah
      idpersona = params[:idp]
      #2018
      ids_pub = Array.new 
      ids_activp = Array.new 
      actual_persona  = Persona.find(idpersona)
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

      #2017 
      @actividades = Historico.where(:persona_id=>idpersona)
      #render json: { html: render_to_string(partial: 'condata', locals: {items_pub:@items_pub,items_activ:@items_activ,items_activp:@items_activp,persona:@persona,actividades:@actividades} )}
    
      #2019
      @act19 = Persona.find(idpersona).actividades.where("estado='S' and aceptado='S'").order(:titulo)
      render json: { html: render_to_string(partial: 'condata', locals: {items_pub:@items_pub,items_activ:@items_activ,items_activp:@items_activp,persona:@persona,actividades:@actividades, act19:@act19} )}

    end

    def hacademico
        periodo = params[:periodo]
        academico = params[:idacademico]
    end


end