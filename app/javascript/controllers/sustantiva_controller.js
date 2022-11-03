import {Controller} from '@hotwired/stimulus'

export default class extends Controller{
  static targets = ['itemsust']  

  connect(){ console.log("sustantivas.....") }

  add(event){
    event.preventDefault()
    var container = document.getElementById("sustantivas")
    var tpl = this.itemsustTarget.innerHTML.replace(/IDX_ITEM/g, Date.now())
    container.insertAdjacentHTML('beforeend', tpl)
  }
  removeItem(event){
    event.preventDefault() 
    var item = event.target.closest('#itemrw')
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = "none"
    item.classList.remove('itemrw')
  }

  input_suma(event){
        var suma = this.itemsuma()
        var total_div = document.getElementById("totalporc")
        if ( suma > 100 ){
              alert("La suma de los porsentajes de colaboración no debe ser mayor a 100")
              event.target.value = 0.0
              this.actualiza_suma()
        }else{
                total_div.innerHTML = suma
        }

  }

  actualiza_suma(){
        var suma = this.itemsuma()
        var total_div = document.getElementById("totalporc")
        total_div.innerHTML = suma
  }

  itemsuma(){
       var elms = document.getElementsByClassName("itemporc")
       var suma = 0.0
       for ( var i = 0; i < elms.length; i++ ){
            if ( elms.item(i).value.length > 0 ){
                    let item_destroy = elms.item(i).id.replace(/_porcentaje/g,'__destroy')
                    if ( document.getElementById(item_destroy).value != '1' ){
                          suma = suma + Number.parseFloat(elms.item(i).value)
                    }     
            }
       }
      return suma 
  }

}
