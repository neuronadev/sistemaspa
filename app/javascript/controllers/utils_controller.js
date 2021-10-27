import {Controller} from "stimulus"

export default class extends Controller {
   
    connect(){ }

    soloDigitos(event){
       
        const valida = ['1','2','3','4','5','6','7','8','9','0','.','Backspace','Tab']
        if ( !valida.includes(event.key) ){
              event.preventDefault()
        } 
     }

}