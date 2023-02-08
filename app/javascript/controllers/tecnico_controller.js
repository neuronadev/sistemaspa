import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  connect(event){}
  sel(event){
        
      event.target.classList.add("bg-light")
  }
  sustantivas(event){
    var div_sustantivas = document.getElementById("div_sustantivas")
    div_sustantivas.style.display="flex"
  }
  closesust(event){
    var div_sustantivas = document.getElementById("div_sustantivas")
    div_sustantivas.style.display="none"
  }
  unsel(event){
    event.target.classList.remove("bg-light")
  }
  closewin(event){
    var idtarget = event.params.idtarget
    var str_div_det = "div_detalle_"+idtarget
    var div_det = document.getElementById(str_div_det)
    div_det.style.display = "none"
  }
  async adicionales(event){
     var idacad = event.params.idacad
     var url = '/validaciones/academicos/adicionales'
     var token = document.querySelector('meta[name="csrf-token"]').content
     var div_adicionales = document.getElementById("div_adicionales")
        await fetch(
            url,
            {
              method: 'POST',
              headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
              body: JSON.stringify( {idacad:idacad} )
            }
        )
        .then( response => response.text() )
        .then( html => {
                         var items = document.getElementsByClassName("list-group-item")
                         for(let i = 0; i < items.length; i++){
                                items[i].classList.remove("fw-bold")
                         }
                         event.target.classList.add("fw-bold") 
                         div_adicionales.innerHTML = html
                        } )
  }

  async detalle(event){
       var idprod = event.params.idprod 
       var str_data_prod = "data_producto_"+idprod
       var str_div_det = "div_detalle_"+idprod
       var div_det = document.getElementById(str_div_det)
       var data_prod = document.getElementById(str_data_prod)

       var url = "/validaciones/academicos/producto"
       var token = document.querySelector('meta[name="csrf-token"]').content
       
       await fetch(   url,
                    { method:'POST', headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                      body: JSON.stringify( {idprod:idprod} )
                    } 
                  ).then( response => response.text() )
                   .then( html => {
                                    data_prod.innerHTML = html
                                  } )

       div_det.style.display = "flex"
  }

  async validar(event){
    var idprod = event.params.idprod
    var tipo = event.params.tipo
    var str_validar = "div_validar_"+idprod
    var div_validar = document.getElementById(str_validar)

    var url = "/validaciones/academicos/validar"
    var token = document.querySelector('meta[name="csrf-token"]').content
    await fetch(   url,
                 { method:'POST', headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                   body: JSON.stringify( {idprod:idprod, tipo:tipo} )
                 } 
    ).then( response => response.text() )
     .then( html => {
                        
                        div_validar.innerHTML = html
                    } ) 
  }
  
  async validarsa(event){
    var idprod = event.params.idprod
    var tipo = event.params.tipo
    var str_validar = "div_validar_sa_"+idprod
    var div_validar = document.getElementById(str_validar)

    var url = "/validaciones/academicos/validarsa"
    var token = document.querySelector('meta[name="csrf-token"]').content
    await fetch(   url,
                 { method:'POST', headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                   body: JSON.stringify( {idprod:idprod, tipo:tipo} )
                 } 
    ).then( response => response.text() )
     .then( html => {
                        
                        div_validar.innerHTML = html
                    } ) 
  }


  async aplicartipo(event){
    var idprod = event.params.idprod
    var tipo = event.params.tipo
    var str_validar = "div_validar_"+idprod
    var div_validar = document.getElementById(str_validar)

    var url = "/validaciones/academicos/aplicartipo"
    var token = document.querySelector('meta[name="csrf-token"]').content
    await fetch(   url,
                 { method:'POST', headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                   body: JSON.stringify( {idprod:idprod, tipo:tipo} )
                 } 
    ).then( response => response.text() )
     .then( html => {   
                        var str_folio = "folio_"+idprod;
                        var str_estado = "estado_"+idprod;
                        var cel_folio = document.getElementById(str_folio);
                        var cel_estado = document.getElementById(str_estado);
                        cel_folio.classList.add("text-success")
                        cel_folio.classList.add("fw-bold")
                        cel_estado.innerHTML=`<span class="badge bg-success"><i class="fa-solid fa-check fw-bold text-white"></i></span>`
                        div_validar.innerHTML = html
                    } ) 
  }

 
  async aplicartiposa(event){
    var idprod = event.params.idprod
    var tipo = event.params.tipo
    var str_validar = "div_validar_sa_"+idprod
    var div_validar = document.getElementById(str_validar)

    var url = "/validaciones/academicos/aplicartiposa"
    var token = document.querySelector('meta[name="csrf-token"]').content
    await fetch(   url,
                 { method:'POST', headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                   body: JSON.stringify( {idprod:idprod, tipo:tipo} )
                 } 
    ).then( response => response.text() )
     .then( html => {   
                        var str_folio = "folio_"+idprod;
                        var str_estado = "estado_"+idprod;
                        var cel_folio = document.getElementById(str_folio);
                        var cel_estado = document.getElementById(str_estado);
                        cel_folio.classList.add("text-success")
                        cel_folio.classList.add("fw-bold")
                        cel_estado.innerHTML=`<span class="badge bg-primary"><i class="fa-solid fa-check fw-bold text-white"></i> SA</span>`
                        div_validar.innerHTML = html
                    } ) 
  }


}  