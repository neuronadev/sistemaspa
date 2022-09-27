import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    static targets =  ["modal"]
    connect(){}

    modalshow(){
        console.log("Mostrar modal...")
        this.element.modal.open(this.modalTarget)
        
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

    submitform(event){
        
    }

}
