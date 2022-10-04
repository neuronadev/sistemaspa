module Actividades::ActividadesHelper
    def row_show(titulo,contenido)
           str = "<div class='row'>
                            <div class='col-md-2 d-flex justify-content-end'> 
                                #{titulo}
                            </div>
                            <div class='col d-flex justify-content-start'>
                                #{contenido}
                            </div>
                  </div>  ".html_safe
    end
end
