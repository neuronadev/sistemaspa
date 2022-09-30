import {Controller} from '@hotwired/stimulus'

export default class extends Controller{
   connect(){
      
      //console.log(window.location.host)
      //console.log(window.location.pathname)
      document.addEventListener("turbolinks:visit", function(event) {
           const url = new URL(event.data.url)
           console.log(url.pathname)
      }) 
   }
}