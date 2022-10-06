module Actividades::ActividadesHelper
    def row_show(titulo,contenido)
           str = "<div class='row mt-1'>
                            <div class='col-md-2 d-flex justify-content-end'> 
                                #{titulo}
                            </div>
                            <div class='col d-flex justify-content-start'>
                                #{contenido}
                            </div>
                  </div>  ".html_safe
    end

    def nomseccion(titulo,subtitulo)
       str = "<div class='row'><h5>#{titulo} </h5>
              <p>#{subtitulo}</p></div>".html_safe
    end
end
