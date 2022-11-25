import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    static targets =  ["modal"]
    connect(){}

    modalshow(event){
        var idactividad = event.params.actividad
        this.element.modal.open(this.modalTarget)
        var btn_acep = document.getElementById('modal_btn_aceptar')
        btn_acep.dataset.act = idactividad
        var btnchk = document.getElementById('checkval')
        btnchk.checked = false
    }

    check(event){
         var btn_acep = document.getElementById("modal_btn_aceptar")

         if ( event.target.checked ){
               btn_acep.disabled = false
         }else{
               btn_acep.disabled = true
         }
    }

    downModal(event){
        this.element.modal.close(this.modalTarget)
    }

    async submitform(event){
        var token = document.querySelector('meta[name="csrf-token"]').content
        var idactividad = event.target.dataset.act
        await fetch(
              '/validaciones/productos/vobousuario',
              {
                 method: 'POST',
                 headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                 body: JSON.stringify( {idprod:idactividad} )
              }       
        )
         .then( response => {
                   
                   var td = document.getElementById(`actividad${idactividad}`)
                   td.innerHTML = `<div class="col validarcr" style="font-size:14px;"><i class="fa-solid fa-arrow-right"></i> En validación</div>`
                   this.element.modal.close(this.modalTarget)

                   alert('Registro validado.')           
         } )
    }

}
