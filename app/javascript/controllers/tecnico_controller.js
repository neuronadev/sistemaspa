import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  connect(event){}
  sel(event){
        
      event.target.classList.add("bg-light")
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

}  