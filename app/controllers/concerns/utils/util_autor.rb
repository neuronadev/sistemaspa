module Utils
    class UtilAutor
        def self.participantes actividad
              str_prts = ''
              #####
              i = 0
              actividad.autores.order(:id).each do |item| 
                   if i > 0 
                       str_prts += '; '
                   end
                   if actividad.fuente != 'V'
                         if item.persona_id != 211
                              str_prts += item.persona.apellidonom
                         else
                              str_prts += (item.autorap||'') + ' ' + (item.autornom||'')
                         end
                    else
                         if item.persona_id != 211
                                str_prts += item.persona.apellidonom
                         else
                                str_prts += (item.firma||'')
                         end
                   end
                i += 1    
              end
              #####
              return str_prts
        end
       
    end
end