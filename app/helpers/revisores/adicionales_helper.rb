module Revisores::AdicionalesHelper
    def act_comprobante actividad
        str = '' 
        if actividad.fuente != 'V'
                if actividad.documentos.attached?
                    actividad.documentos.each do |d|
                        str += "<div>
                                    #{ link_to d.filename, rails_blob_path(d, disposition: 'attachment'), { target: '_blank' } }
                                </div>"
                    end
                end
        else
                if actividad.enlacedoc.attached?
                    str = "<div>
                             #{link_to actividad.enlacedoc.filename, rails_blob_path(actividad.enlacedoc, disposition: 'attachment', target: '_blank')}
                          </div>"
                end
        end        
        str
    end
end
