import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="journal"
export default class extends Controller {
  connect() {
    console.log("yellow")
  }
}
