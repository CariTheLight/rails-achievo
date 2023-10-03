import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
      '"Distance brings perspective" - Justin Terblanche',
      '"Keep going, without fear" - Ricardo Nelumba',
      '"Team work makes the dream work" - Carine Rugorirwera',
      '"Dream big, start small" - Jenovi Wayela',
      '"For the light to shine brightly, there must be darkness" - Jono Watkins',
      '"Fake it til you make it!" - Olivier Girardot',
      '"In war, victory does not come to the one who plays by the rules, but to the one who makes the rules and imposes them on the enemy" - Kiki Kennedy',
      '"Comparison is the thief of joy" - Justin Terblanche',
      '"If you want to get better, do the things that no one else wants to do. Do the things that no one is even thinking about doing" - Sebastian Carr',
      '"In the morning, either you go back to bed to continue dreaming, or you get up to make your dreams come true" - Olivier Girardot',
      '"If you\'re going through hell, keep going" - Liam Strickland',
      ],
      typeSpeed: 30,
      backSpeed: 5,
    })
  }
}
