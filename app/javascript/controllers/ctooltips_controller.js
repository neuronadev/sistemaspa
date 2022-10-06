import {Controller} from '@hotwired/stimulus'

export default class extends Controller{

  connect(event){ 
       this.tooltips()
   }

   tooltips(){
      var tooltip_elms = document.querySelectorAll('[data-bs-toggle="tooltip"]')
      for ( let i=0; i < tooltip_elms.length; i++ ){
           new bootstrap.Tooltip(tooltip_elms[i])
      }

}
}   