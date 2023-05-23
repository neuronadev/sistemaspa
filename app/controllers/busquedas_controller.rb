class BusquedasController < ApplicationController
    layout 'busquedas'

    def index

    end

    def producto
        txt_q = params[:txt]
        @actividades = Actividad.search_by_titulo(txt_q).where(periodo:2023)
        render partial: "productos"
    end
end
