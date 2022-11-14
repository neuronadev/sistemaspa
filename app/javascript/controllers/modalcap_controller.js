import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
import TomSelect from "tom-select"

export default class extends Controller {

  static targets =  ["modal"]

  launchModal(event) {
       var source = event.params.src
       var prod = event.params.prod
       this.element.modal.open(this.modalTarget)
       
       var modal_btn_aceptar = document.getElementById('modal_btn_aceptar')
       var modal_btn_cancelar = document.getElementById('modal_btn_cancelar')
       modal_btn_aceptar.style.display = 'flex'
       modal_btn_cancelar.innerHTML = 'Cancelar'

       this.form(source, prod)
  }
  downModal(){
      this.element.modal.close(this.modalTarget)
  }

  submitform(event){
      var form = document.getElementById('formmodal')
      Rails.fire(form, 'submit')
  }

  async form(source, prod){
      //let select = document.getElementById('actividad_capitulo_attributes_libro_id')
      //let control = select.tomselect
      //control.enable()
      //control.destroy()
      //new TomSelect('#actividad_capitulo_attributes_libro_id',{
       // maxOptions:null
      //})
      var token = document.querySelector('meta[name="csrf-token"]').content
      var modal_body = document.getElementById('modal_body')
      try{
            await fetch(`/actividades/editoriales/new?prod=${prod}`,{
                method:'GET',
                headers: {  'X-CSRF-Token': token}
            })
             .then( response => response.text() )
             .then( html => { modal_body.innerHTML = html } )

      }catch(e){}

      
  }


  onSuccess(event){
    var modal_body = document.getElementById('modal_body') 
    var pathf = document.getElementById('pathf')
    var modal_btn_aceptar = document.getElementById('modal_btn_aceptar')
    var modal_btn_cancelar = document.getElementById('modal_btn_cancelar')
  
    var select = null 

      let [data, status, xhr] = event.detail
      if ( status == 'OK' ){
           
            let data = JSON.parse(xhr.response)
            if ( pathf.value == 'CAPITULO' ){
                      select = document.getElementById('actividad_capitulo_attributes_libro_id')
            }
            if ( pathf.value == 'ART-C-JCR' || pathf.value == 'ART-C-CONACYT' || pathf.value == 'ART-C-OTROS' ){
                      select = document.getElementById('actividad_articulo_attributes_revista_id')
             } 
             if ( pathf.value == 'ART-P' ){
                     select = document.getElementById('actividad_articulo_attributes_revista_id')
             } 
             if ( pathf.value == 'ART-D' ){
                select = document.getElementById('actividad_articulo_attributes_revista_id')
            }

            let control = select.tomselect
            control.addOption({value:data.id, text:data.txt})
            control.refreshItems()
            control.setValue(data.id, false)
            modal_body.innerHTML = 'Registro realizado correctamente.'
            modal_btn_aceptar.style.display = 'none'
            modal_btn_cancelar.innerHTML = 'Cerrar'
           
      }
  }
  onError(event){
      alert("Error en la información. En este formulario hay campos obligatorios.")
  }
  
}