import { Controller } from "@hotwired/stimulus"
import { Confetti } from "stimulus-confetti"
// Connects to data-controller="confetti"
export default class extends Controller {
  connect() {
  console.log("hello from confetti")
  document.getElementById('celebrate-button').addEventListener('click', (e) => {
    createConfetti();

    });

  }
}

  function createConfetti() {
    console.log("create")
  const confetti = document.querySelector('.confetti-container');
  // const confetti = document.createElement('div');
  confetti.className = 'confetti';
  confetti.style.left = `${Math.random() * 100}%`;
  confetti.style.animationDuration = `${Math.random() * 3 + 2}s`;
  confetti.style.animationDelay = `${Math.random() * 2}s`;

  confetti.addEventListener('animationiteration', () => {
  confetti.remove();
  });

  // confettiContainer.appendChild(confetti);
  }
