import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['form', 'loadingScreen', 'submitButton'];

  connect() {
    console.log("Hello")
  }

  showLoadingScreen() {
    console.log("loadingScreenTarget")
    // this.loadingScreenTarget.style.display = 'flex'; // Show loading screen
    // this.submitButtonTarget.setAttribute('disabled', 'disabled'); // Disable submit button
  }
}
