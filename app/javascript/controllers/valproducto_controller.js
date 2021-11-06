import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

 connect(){ console.log("vldandoo. conected.") } 

  showTargetInfo( event ){
      event.preventDefault()
      let trval = event.params.trval
      let trval_div = document.getElementById(trval)
      if ( trval_div.style.display == 'none' ){
           trval_div.style.display = 'table-row'
           fetch(`infoproducto/${trval}`)
                 .then( response => response.text() )
                 .then ( html => { trval_div.querySelector('div').innerHTML = html  } )

      }else{
           trval_div.style.display = 'none' 
       }
  }


}