import {Controller} from '@hotwired/stimulus'

var dragSrcEl;

export default class extends Controller{

  connect(event){ 
       this.validarControles(event)
       this.tooltips()
   }

  static targets = ['tplautor', 'contautores']

  addItem(event){
     event.preventDefault()
     var tooltipEl = bootstrap.Tooltip.getInstance(event.target)
     tooltipEl.hide()
     var tpl_c = this.tplautorTarget.innerHTML.replace(/RW_AUTOR/g, Date.now())
     this.contautoresTarget.insertAdjacentHTML('beforeend', tpl_c)
     this.tooltips()
  }

  removeItem(event){
    event.preventDefault() 
    var tooltipEl = bootstrap.Tooltip.getInstance(event.target)
    tooltipEl.hide()
    var item = event.target.closest('.itemrw')
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = "none"
    item.classList.remove('itemrw')
  }

  async search(event){
    event.preventDefault()
    var txt_val = event.target.value
    var el_fila = event.target.closest('.itemrw')
    var list_per = el_fila.querySelector(".listaper")
    var input_idp = el_fila.querySelector(".autoridp")

    var token = document.querySelector('meta[name="csrf-token"]').content
    if ( txt_val.trim().length >= 3 ){
          var data = await fetch(
                            '/personas/search',
                            {
                              method: 'POST',
                              headers: { 'Content-Type':'application/json', 'Accept':'application/html', 'X-CSRF-Token': token },
                              body: JSON.stringify( {txt:txt_val} )
                            }
                      )
                      .then( response => response.text() )
                      .then( html => {
                                          if ( html.length > 0 ){
                                                 list_per.innerHTML = html 
                                                 list_per.style.display = 'block'
                                          }else{
                                                 input_idp.value = 211
                                          }
                                     } )
    }else{
           list_per.innerHTML = ''
           list_per.style.display = 'none'
      }
  }

  hiddenSearch(event){
    event.preventDefault()
    var el_fila = event.target.closest('.itemrw')
    var list_per = el_fila.querySelector(".listaper")
    list_per.innerHTML = ''
    list_per.style.display = 'none'
  }

  selecItem(event){
      event.preventDefault()

      var idp = event.params.idp
      var nombre = event.params.nom
      var apell = event.params.apell

      
      var el_fila = event.target.closest('.itemrw')
      var input_idp = el_fila.querySelector(".autoridp")
      var input_apell = el_fila.querySelector(".autorap")
      var input_nom = el_fila.querySelector(".autornom")

      input_idp.value = idp
      input_apell.value = apell
      input_nom.value = nombre

      this.hiddenSearch(event)

      input_nom.focus()
  }

  kEnter(event){
    
    if (event.key === "Enter") {
          event.preventDefault();
    }

  }

  tipoAutor(event){
     var el_fila = event.target.closest('.itemrw')
     var input_idp = el_fila.querySelector(".autoridp")
     var div_tipo = el_fila.querySelector(".tipoautor")
 
     if ( input_idp.value == '211' ){
            div_tipo.classList.remove('text-secondary')
            div_tipo.classList.remove('text-primary')
            div_tipo.classList.add('text-secondary')
     }else{
            div_tipo.classList.remove('text-secondary')
            div_tipo.classList.remove('text-primary')
            div_tipo.classList.add('text-primary')
     }

  }

  clearFields(event){

    var el_fila = event.target.closest('.itemrw')
    var input_idp = el_fila.querySelector(".autoridp")
    var input_apell = el_fila.querySelector(".autorap")
    var input_nom = el_fila.querySelector(".autornom")

    input_idp.value = 211
    input_apell.value = ''
    input_nom.value = ''

  }


  validarControles(event){
      var elms = document.getElementsByClassName('itemrw')
      for ( let i = 0; i < elms.length; i++ ){
             let ctrl_div = elms[i].querySelector('#controles')
             let ctrl_a = ctrl_div.querySelector('#controla')
             let ctrl_b = ctrl_div.querySelector('#controlb')

             if ( i == 0 ){ ctrl_a.innerHTML = '' }
             if ( i == 0 && elms.length > 1 ) { ctrl_b.innerHTML = '' }
             if ( i == 0 && elms.length == 1 ) { ctrl_b.innerHTML = `<div class="align-middle"><i class="fa-solid fa-circle-plus text-success cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top" title="Agrear fila" data-action="click->autores#addItem click->autores#validarControles"></i></div>` }
             if ( i > 0 && i != elms.length-1 ){ ctrl_b.innerHTML = '' }
             if ( i == elms.length-1 ){ ctrl_b.innerHTML = `<div class="align-middle"><i class="fa-solid fa-circle-plus text-success cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top" title="Agrear fila" data-action="click->autores#addItem click->autores#validarControles"></i></div>` }
      }
      this.tooltips()
  }

  handleDragStart(event) {

        console.log("STAR")
        event.target.style.opacity = '0.4';
        dragSrcEl = event.target;
        event.dataTransfer.effectAllowed = 'move';
        event.dataTransfer.setData('text/html', event.target.innerHTML);
        console.log(event.dataTransfer.getData('text/html'))
  }

  handleDragEnd(event) {

        console.log("END")
        event.target.style.opacity = '1';
  }

  handleDrop(event){
      
        if (dragSrcEl !== event.target) {
               event.target.insertAdjacentHTML('beforeend',event.dataTransfer.getData('text/html'))
               //dragSrcEl.innerHTML = event.target.innerHTML;
               //event.target.innerHTML = event.dataTransfer.getData('text/html')
        }
        return false;
  }

  handleDragOver(e) {
    if (e.preventDefault) {
          e.preventDefault();
    }
    return false;
  }

  handleDragEnter(e) {
    
  }

  handleDragLeave(e) {

  }

  tooltips(){
      //var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      //var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
           //return new bootstrap.Tooltip(tooltipTriggerEl)
      //})

      var tooltip_elms = document.querySelectorAll('[data-bs-toggle="tooltip"]')
      
      for ( let i=0; i < tooltip_elms.length; i++ ){
             new bootstrap.Tooltip(tooltip_elms[i])
      }

  }

}