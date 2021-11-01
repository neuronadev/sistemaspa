module ActividadesHelper
    include Pagy::Frontend
    def modificaPersona(actividadid)
        autores =  Autor.where(:actividad_id=>actividadid).where(:corresponsal=>'S').where("persona_id<>211").where("persona_id<>212").order("posicion asc").first
        if !autores.nil?
            autores.persona_id
        else
            autores =  Autor.where(:actividad_id=>actividadid).order("posicion asc").first        
            autores.persona_id
        end
    end

    def valida_participantes(params)
        if !params[:actividad][:autores_attributes].present?
             return true
        else
             return false
        end            
    end

    def valida_items_curso(params)
        errors_items_participan = false
        errors_items_messages = [] 
        params[:actividad][:autores_attributes].each do |p,v|
                if !v[:horas].present?
                    errors_items_participan = true
                    errors_items_messages << {'horas'=>p}
                end
                if !v[:posgradoc].present?
                    errors_items_participan = true
                    errors_items_messages << {'posgradoc'=>p}
                end
        end
        return errors_items_participan, errors_items_messages
   end

   def valida_doc_onactividad(params)
        if !params[:actividad][:tesisdoc].present?
            return true
        else
            return false 
        end
   end

   def valida_enlacedoc_onactividad(params)
    if !params[:actividad][:enlacedoc].present?
        return true
    else
        return false 
    end
   end

   def mensaje_txt(idactividad)
       m = Mensaje.where(actividad_id:idactividad).last
       if m.nil?
             ''
       else
             m.txt
       end  
   end

end
