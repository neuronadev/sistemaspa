import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

export default class extends Controller {

  static targets =  ["modal"]

  launchModal() {
      this.element.modal.open(this.modalTarget)
  }
  downModal(){
      this.element.modal.close(this.modalTarget)
      this.refresh()
  }

  refresh(){
      let select = document.getElementById('actividad_capitulo_attributes_libro_id')
      let control = select.tomselect
      control.enable()
      //control.destroy()
      //new TomSelect('#actividad_capitulo_attributes_libro_id',{
       // maxOptions:null
      //})
      
  }
}