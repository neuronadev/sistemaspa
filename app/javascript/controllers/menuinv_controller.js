import {Controller} from '@hotwired/stimulus'

export default class extends Controller{
   
   connect(){
      
      //if (this.iniMenu() == 'N' ){
      //      var elini = document.getElementById('menuini')
      //      elini.classList.add('menubg')
      //      elini.classList.add('rounded-pill')
      //}

      document.addEventListener("turbolinks:load", function(event) {
            const url = new URL(event.data.url)
            var parts = url.pathname.split("/")
            //console.log(parts[parts.length-1])
            if ( isNaN(parts[parts.length-1]) ){
               if ( parts[parts.length-1] == 'actividades' || parts[parts.length-1] == 'edit' ){
                  clearItems()   
                  selItem('menuini') 
               }

               if ( parts[parts.length-1] == 'catalogos' || parts[parts.length-1] == 'new' ){
                        clearItems()   
                        selItem('catalogos') 
               }
            }else{
                  clearItems()   
                  selItem('menuini') 
            }

               
            function clearItems(){
               let list_items = document.getElementsByClassName("menuitem")
               for( let i = 0; i < list_items.length; i++ ){
                        list_items[i].classList.remove('menubg')
                        list_items[i].classList.remove('rounded-pill')
               } 
            }
            function selItem(str_el){
               var el = document.getElementById(str_el)
               el.classList.add('menubg')
               el.classList.add('rounded-pill')
            }
       }
         
      ) 
   }
   iniMenu(){
      let list_items = document.getElementsByClassName("menuitem")
      let cont = 'N'
      for( let i = 0; i < list_items.length; i++ ){
             if ( list_items[0].classList.contains('menubg') ){
                    cont = 'S'
             }
      }    
      return cont
   }
}