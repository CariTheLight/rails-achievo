import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['screen', 'form'];

  connect() {
    console.log(this.screenTarget.classList)
  }

  showLoadingScreen() {
    console.log("screenTarget")

    this.screenTarget.classList.remove("d-none")
    this.formTarget.classList.add("d-none")
    // this.element.requestSubmit();
    // this.loadingScreenTarget.style.display = 'flex'; // Show loading screen
    // this.submitButtonTarget.setAttribute('disabled', 'disabled'); // Disable submit button
  }
}
