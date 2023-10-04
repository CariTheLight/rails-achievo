// // app/javascript/controllers/task_completion_controller.js
// import { Controller } from "stimulus"

// export default class extends Controller {
//   static targets = ["progressBar"]
//   static values = { goalId: Number }

//   complete() {
//     const goalId = this.goalIdValue

//     // Send an AJAX request to update progress when a task is completed
//     fetch(`/goals/${goalId}/update_progress`, {
//       method: 'POST',
//       headers: {
//         'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'), // Include CSRF token
//         'Content-Type': 'application/json',
//         'Accept': 'application/json'
//       }
//     })
//       .then(response => response.json())
//       .then(data => {
//         // Update the progress bar on the page
//         this.progressBarTarget.style.width = `${data.progress}%`
//       })
//       .catch(error => {
//         console.error(error)
//       })
//   }
// }
