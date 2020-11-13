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
end
