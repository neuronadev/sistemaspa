import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

  verProducto( event ){
      event.preventDefault()
      console.log("Mostrar div detalle")
  }


}