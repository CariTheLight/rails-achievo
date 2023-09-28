import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quote-rotation"
export default class extends Controller {
  static targets = ["quote"];

  connect() {
    console.log("hello ;)")
    this.index = 0;
    this.quotes = JSON.parse(this.data.get("quotes"));

    this.rotateQuote();
  }

  rotateQuote() {
    if (this.index >= this.quotes.length) {
      this.index = 0;
    }

    this.quoteTarget.textContent = this.quotes[this.index];
    this.index++;

    setTimeout(() => {
      this.rotateQuote();
    }, 5000); // Rotate every 5 seconds
  }
}
