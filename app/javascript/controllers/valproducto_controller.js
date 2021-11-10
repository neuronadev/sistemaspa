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
                 .then ( html => { 
                          trval_div.querySelector('div').innerHTML = html  
                          document.getElementById(tritem).classList.add('text-muted')
                  } )

      }else{
           trval_div.style.display = 'none' 
           document.getElementById(tritem).classList.remove('text-muted')
       }
  }

  cerrarTargetInfo(event){
    event.preventDefault()
    let trval = event.params.trval
    let tritem = event.params.tritem
    let trval_div = document.getElementById(trval)
    trval_div.style.display = 'none' 
    document.getElementById(tritem).classList.remove('text-muted')
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
     
    var [ref,idp,idact] = tritem.split('_')
    var colval = "colsa_" + idact
    
    if (confirm('Esta acción marcará el producto con el VoBo de la Secretaría Académica. ¿Desea continuar?')) {
         fetch(`aceptarproducto/${trval}/${tritem}`)
         .then( response => response.text() )
                .then ( html => { 
                         trval_div.querySelector('div').innerHTML = html
                         document.querySelectorAll(`[id=${colval}]`).forEach(html=> 
                          html.querySelector('div').innerHTML= `
                          <a href="#" data-action="click->valproducto#showTargetInfo" data-valproducto-trval-param="trval_${html.getAttribute('data-pid')}_${idact}" data-valproducto-tritem-param="tritem_${idp}_${idact}">
                             <i class="fas fa-check-double text-success"></i>
                             <span class="text-success"> <small> Validado </small> </span>
                          </a>`
                       ) 
                    })
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

    var [ref,idp,idact] = tritem.split('_')
    var colval = "colsa_" + idact

    document.querySelectorAll(`[id=${colval}]`).forEach(html=> 
      html.querySelector('div').innerHTML= `
      <a href="#" data-action="click->valproducto#showTargetInfo" data-valproducto-trval-param="trval_${html.getAttribute('data-pid')}_${idact}" data-valproducto-tritem-param="tritem_${idp}_${idact}">
         <i class="fas fa-user-times text-danger"></i>
         <span class="text-danger"> <small> No considerar </small> </span>
      </a>`
     ) 
  }

}