import { Controller } from "@hotwired/stimulus"
import { Confetti } from "stimulus-confetti"
// Connects to data-controller="confetti"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
