import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-modal"
export default class extends Controller {
  connect() {
  }
  close(e) {
    e.preventDefault();

    const modal = document.querySelector('.shopping-modal');
    modal.innerHTML = ''

    modal.removeAttribute('src');
    modal.removeAttribute('complete');
  }
}
