import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
   
    connect(){ }

    validado(event){
        event.preventDefault()
        let trval = event.params.trval
        let tr = document.getElementById(trval)
       
         
        let div_target = document.getElementById("acvalidados")
        tr.classList.add("error")

        if (confirm('¿Desea mover este registro a la sección de validados?')) {
               
              fetch(`/valactividades/validaciones/academicook/${trval}`)
                    .then( response => response.text() )
                    .then ( html => { div_target.innerHTML = html  } )
                    tr.style.backgroundColor = 'grey'
                    setTimeout( ()=> {tr.style.display = 'none'},.4*1000)
        }else{
            tr.classList.remove("error")
        }

    }
}