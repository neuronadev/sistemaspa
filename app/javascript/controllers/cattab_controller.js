import {Controller} from '@hotwired/stimulus'

export default class extends Controller{
   static values = { url: String }

   connect(){
      if ( this.activo() == 'N' ){
             this.activini()
      }
   }

   activo(){
        var headitems = document.getElementsByClassName("headitem")
        var exist = 'N' 
        for ( let i = 0; i < headitems.length; i++ ){
               if ( headitems[i].classList.contains('active') ){
                   exist = 'S'
               }
        }
        return exist
   }
   async activini(){
        var headitems = document.getElementsByClassName("headinicio")
        var cont = document.getElementById("contcat")
        var token = document.querySelector('meta[name="csrf-token"]').content
        for ( let i = 0; i < headitems.length; i++ ){
                headitems[i].classList.remove("bg-secondary")
                headitems[i].classList.add("bg-primary")
        }
        await fetch(
            '/actividades/catalogos/listcat',
            {
              method: 'POST',
              headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
              body: JSON.stringify( {idcat:'ini'} )
            }
         ) 
          .then( response => response.text() )
          .then( html => { cont.innerHTML = html 
                           cont.classList.add("active")
                         } )
   }

   
   overbackcolor(event){
       event.target.classList.add("bg-gradient")
   }

   outbackcolor(event){
       event.target.classList.remove("bg-gradient")
   }

   backcolor(event){

       var eltab = event.target.closest(".eltab")
       var headitems = eltab.getElementsByClassName("headitem")
       
       for ( let i = 0; i < headitems.length; i++ ){
             if ( headitems[i].id  != event.target.id ){
                 headitems[i].classList.remove("bg-primary")
                 headitems[i].classList.remove("bg-gradient")
                 headitems[i].classList.remove("active")
                 headitems[i].classList.add("bg-secondary")
             }     
       }
       event.target.classList.remove("bg-secondary")
       event.target.classList.add("bg-primary")
   }

   async conttab(event){
        var idx = event.target.id
        var eltab = event.target.closest(".eltab")
        var cont = eltab.querySelector(".cont")
        var token = document.querySelector('meta[name="csrf-token"]').content
        

        await fetch(
                      '/actividades/catalogos/listcat',
                      {
                        method: 'POST',
                        headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                        body: JSON.stringify( {idcat:idx} )
                      }
                   ) 
                    .then( response => response.text() )
                    .then( html => { cont.innerHTML = html 
                                     event.target.classList.add("active")
                                   } )
   }

   form(event){
      window.location.href = event.params.url
   }

}