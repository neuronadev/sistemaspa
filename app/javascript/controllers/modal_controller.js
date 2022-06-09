import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


  connect() {
    this.element[this.identifier] = this;       
  }

  open(p_target) {
    document.body.classList.add("modal-open");
    p_target.setAttribute("style", "display: block;");
    p_target.classList.add("show");
    //document.body.innerHTML += '<div class="modal-backdrop fade show"></div>';
  }
  close(p_target) {
    document.body.classList.remove("modal-open");
    p_target.removeAttribute("style");
    p_target.classList.remove("show");
    //document.getElementsByClassName("modal-backdrop")[0].remove();
  }
}