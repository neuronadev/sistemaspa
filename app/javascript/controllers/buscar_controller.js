import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    connect(){}

    frase(event){
          var input_txt = document.getElementById("txt")
          var txt = input_txt.value
          console.log(txt)
          this.buscar(txt)
    }

    async buscar(txt){
        var url = '/busquedas/producto'
        var resultado = document.getElementById("resultado")
        var token = document.querySelector('meta[name="csrf-token"]').content
        await fetch(
            url,
            {
              method: 'POST',
              headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
              body: JSON.stringify( {txt:txt} )
            }
        )
        .then( response => response.text() )
        .then( html => {
                           resultado.innerHTML = html
                        } )
    }

}