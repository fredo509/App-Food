import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shopping-modal"
export default class extends Controller {
  connect() {
  }
  close(e) {
    e.preventDefault()
  }
}
