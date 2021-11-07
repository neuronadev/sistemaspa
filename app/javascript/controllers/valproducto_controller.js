import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

 connect(){ console.log("vldandoo. conected.") } 

  showTargetInfo(event){
      event.preventDefault()
      let trval = event.params.trval
      let tritem = event.params.tritem
      let trval_div = document.getElementById(trval)
      if ( trval_div.style.display == 'none' ){
           trval_div.style.display = 'table-row'
           fetch(`infoproducto/${trval}/${tritem}`)
                 .then( response => response.text() )
                 .then ( html => { trval_div.querySelector('div').innerHTML = html  } )

      }else{
           trval_div.style.display = 'none' 
       }
  }

  actionBack(event){
    event.preventDefault()
    let trval = event.params.trval
    let tritem = event.params.tritem
    let trval_div = document.getElementById(trval)

    fetch(`infoproducto/${trval}/${tritem}`)
                 .then( response => response.text() )
                 .then ( html => { trval_div.querySelector('div').innerHTML = html  } )

  }

  aceptarProducto(event){
    event.preventDefault()
    let trval = event.params.trval
    let tritem = event.params.tritem
    let trval_div = document.getElementById(trval)
    let tritem_data = document.getElementById(tritem)

    if (confirm('Esta acción marcará el producto con el VoBo de la Secretaría Académica. ¿Desea continuar?')) {
         fetch(`aceptarproducto/${trval}/${tritem}`)
         .then( response => response.text() )
                .then ( html => { 
                         trval_div.querySelector('div').innerHTML = html
                    } )
    } 

  }

  aceptarCorregir(event){
    event.preventDefault()
    let trval = event.params.trval
    let tritem = event.params.tritem
    let trval_div = document.getElementById(trval)
    let tritem_data = document.getElementById(tritem)

       fetch(`corregirproducto/${trval}/${tritem}`)
         .then( response => response.text() )
                .then ( html => { 
                         trval_div.querySelector('div').innerHTML = html
                    } )
  }

  aceptarRechazar(event){
    event.preventDefault()
    let trval = event.params.trval
    let tritem = event.params.tritem
    let trval_div = document.getElementById(trval)
    let tritem_data = document.getElementById(tritem)

         fetch(`rechazarproducto/${trval}/${tritem}`)
         .then( response => response.text() )
                .then ( html => { 
                         trval_div.querySelector('div').innerHTML = html
                    } )
  }
  onPostMensaje(event){
    let trval = event.params.trval
    let tritem = event.params.tritem
    let trval_div = document.getElementById(trval)
    let tritem_data = document.getElementById(tritem)
    let [data, status, xhr] = event.detail;
    trval_div.querySelector('div').innerHTML = xhr.response
  }

}