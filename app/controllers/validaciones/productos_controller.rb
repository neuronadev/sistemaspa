class Validaciones::ProductosController < ApplicationController
    def vobousuario
        idactividad = params[:idprod]
        actividad = Actividad.find(idactividad)
        actividad.estado = 'U'
        actividad.fecha1 = Date.today
        actividad.save
    end
end
