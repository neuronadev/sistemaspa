import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

   connect(){console.log("valida tecnicos")}

   mostrarSust(event){
       event.preventDefault()
       let trdata = event.params.idp
       console.log(trdata)
       let tr_div = document.getElementById(trdata)

       if ( tr_div.style.display == 'none' ){
             tr_div.style.display = 'table-row'
             event.target.closest('td').innerHTML = `<a data-action="click->vtecnicos#mostrarSust" data-vtecnicos-idp-param="${trdata}" href="#">
                                                         <i class="fas fa-chevron-down"></i>
                                                      </a>`
       }else{
             tr_div.style.display = 'none' 
             event.target.closest('td').innerHTML = `<a data-action="click->vtecnicos#mostrarSust" data-vtecnicos-idp-param="${trdata}" href="#">
                                                         <i class="fas fa-chevron-right"></i>
                                                      </a>`
       }
   }

}