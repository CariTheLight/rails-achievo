import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="string-display"
export default class extends Controller {
  static targets = ["quote"];
  static values = { quotes: Array };

  connect() {
    console.log("hello from quotes controller")
    this.index = 0;
    this.displayString();
    this.interval = setInterval(this.changeString.bind(this), 5000);
  }

  disconnect() {
    clearInterval(this.interval);
  }

  displayString() {
    this.quoteTarget.textContent = this.quotesValue[this.index];
  }

  changeString() {
    this.index = (this.index + 1) % this.quotesValue.length;
    this.displayString();
  }
}
