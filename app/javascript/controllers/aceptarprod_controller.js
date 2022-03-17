import { Controller } from "@hotwired/stimulus"

export default class extends Controller{

    vbproductos(event){
        event.preventDefault()
        if (confirm('Con esta acción esta aceptando la evaluación que se realizó sobre los productos académicos 2021 y serán las base para el cálculo de estímulos. ¿Desea continuar?')) {
             var el = document.getElementById("vbprod")
             let id = event.params.id
             
             fetch(`/valactividades/validaciones/vbproduccion/${id}`)
                    .then( response => response.text() )
                    .then ( html => { 
                        el.innerHTML = `<div class="alert alert-success" role="alert">
                                           <i class="fas fa-user-check"></i> Producción académica validada.
                                        </div>`
                          })
        }else{
            console.log("No acepto");
        }
    }
}