import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
   
    connect(){}

    seccVal(event){
       event.preventDefault() 
       let row_div = event.params.row
       let element_div = document.getElementById(row_div)
       let element_tr = document.getElementById(row_div.replace("div","tr"))
       let data = row_div.split("_")
       
       if (element_div.style.display == 'none'){
              element_div.style.display = 'table-row'
              element_tr.classList.add("text-muted")

              fetch(`items/${data[2]}/${data[1]}`)
                 .then( response => response.text() )
                 .then ( html => { element_div.innerHTML = html  } )


       }else{
              element_div.style.display = 'none'  
              element_tr.classList.remove("text-muted") 
       }
       
    }

    btnAceptar(event){
        event.preventDefault()
        let row_div = event.params.rowfuente
        let element_div = document.getElementById(row_div)
        let data = row_div.split("_")
        let id_tabletr = `tr_${data[1]}_${data[2]}`
        let tabletr = document.getElementById(id_tabletr)    

        if (confirm('Esta acción marcará el producto con el VoBo de la Coordinación de red. ¿Desea continuar?')) {
                fetch(`itemaceptar/${data[2]}/${data[1]}`)
                .then( response => response.text() )
                .then ( html => { 
                    tabletr.innerHTML = html 
                    element_div.style.display = 'none' 
                    } )
        }            
    }

    btnCorregir(event){
        event.preventDefault()
        let row_div = event.params.rowfuente
        let element_div = document.getElementById(row_div)
        let data = row_div.split("_")
        fetch(`itemcorregir/${data[2]}/${data[1]}`)
        .then( response => response.text() )
        .then ( html => { 
                element_div.innerHTML = html 
            } )
    }
    btnRechazar(event){
        event.preventDefault()
        let row_div = event.params.rowfuente
        let element_div = document.getElementById(row_div)
        let data = row_div.split("_")
        fetch(`itemrechazar/${data[2]}/${data[1]}`)
        .then( response => response.text() )
        .then ( html => { 
                element_div.innerHTML = html 
            } )
    }

    btnRegresarIni(event){
        event.preventDefault()
        let row_div = event.params.row
        let element_div = document.getElementById(row_div)
        element_div.style.display = 'table-row'
        let data = row_div.split("_")
        fetch(`items/${data[2]}/${data[1]}`)
                 .then( response => response.text() )
                 .then ( html => { element_div.innerHTML = html  } )
    }

    onPostMensaje(event){
        let [data, status, xhr] = event.detail;
        let row_div = event.params.row
        let element_div = document.getElementById(row_div)
        element_div.innerHTML = xhr.response
    }
}    