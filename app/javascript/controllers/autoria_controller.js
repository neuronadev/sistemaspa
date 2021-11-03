import {Controller} from "@hotwired/stimulus"



export default class extends Controller {
  static targets = ["tmpAutor", "rwsAutores", "tmpAutorExt"]
  
  nuevoPart(event){
      event.preventDefault();
      var c = this.tmpAutorTarget.innerHTML.replace(/TEMPLATE_RECORD_AUTOR/g, Math.floor(Math.random()*10000000000000000000))
      this.rwsAutoresTarget.insertAdjacentHTML('beforeend', c)
     
  }

  nuevoPartExt(event){
      event.preventDefault()
      var c = this.tmpAutorExtTarget.innerHTML.replace(/TEMPLATE_RECORD_AUTOR_EXT/g, Math.floor(Math.random()*10000000000000000000))
      this.rwsAutoresTarget.insertAdjacentHTML('beforeend', c)
  }

  quitarPart(event){
      event.preventDefault();
      let rw = event.target.closest(".rwautor")
      rw.querySelector("input[name*='_destroy']").value = 1
      rw.style.display = 'none'
  }

}