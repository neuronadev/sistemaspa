module AutoresHelper
    def reporta(personaid)
        str_reporta = ''
        p = Persona.find(personaid)
        str_reporta = (p.paterno||'') + ' ' + (p.materno||'') + ' ' + (p.nombre||'')
        str_reporta
    end
    def cita(actividadid)
        actividad = Actividad.find(actividadid)
        i=0
        str = ""
        simbolo = ""
        actividad.autores.order("posicion asc").each do |a|
            if i > 0  
                simbolo = "; " 
             else
                simbolo = "" 
            end
            
            if !a.firma.present?
                str = str + simbolo + (a.persona.paterno||"") + "," + (a.persona.nombre||"")
            else
                str = str + simbolo + (a.firma||"")
            end
            if a.corresponsal == 'S'
                str = str + "<strong>*</strong>" 
            end     
           i = i+1     
        end
        str
    end
    def citaConIdentificacion(actividadid)
        actividad = Actividad.find(actividadid)
        i=0
        str = ""
        simbolo = ""
        actividad.autores.order("posicion asc").each do |a|
            if i > 0  
                simbolo = "; " 
             else
                simbolo = "" 
            end
            esinceol = 'N'
            if a.persona_id!=211 && a.persona_id!=212
               esinceol = 'S'
            end
            if !a.firma.present?
                if esinceol == 'S'
                   str = str + simbolo + "<b>" + (a.persona.paterno||"") + "," + (a.persona.nombre||"") + "</b>"
                else
                   str = str + simbolo + (a.persona.paterno||"") + "," + (a.persona.nombre||"")     
                end   
            else
                if esinceol == 'S'  
                    str = str + simbolo + "<b>" +(a.firma||"") + "</b>"
                else
                    str = str + simbolo + (a.firma||"")      
                end  
            end
            if a.corresponsal == 'S'
                str = str + "<strong>*</strong>" 
            end     
           i = i+1     
        end
        str
    end
    def autinecol(actividadid)
        actividad = Actividad.find(actividadid)
        i=0
        str = ""
        simbolo = ""
        actividad.autores.where("persona_id!=211 and persona_id!=212").order("posicion asc").each do |a|
            if i > 0  
                simbolo = "; " 
             else
                simbolo = "" 
            end
            if !a.firma.present?
                str = str + simbolo + (a.persona.paterno||"") + "," + (a.persona.nombre||"")
            else
                str = str + simbolo + (a.firma||"")
            end     
            if a.corresponsal == 'S'
                str = str + "*" 
            end
           i = i+1     
        end
        str
    end

   
end
