import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["completed"];

  connect() {
    console.log("howdy")
  }

  toggle(event) {
    console.log("toggled!");
    const taskId = this.completedTarget.dataset.taskId;
    const completed = event.target.checked;

    Rails.ajax({
      url: `/tasks/${taskId}`,
      type: "PATCH",
      data: `task[completed]=${completed}`,
      success: () => {
        console.log("Task updated successfully!");
      },
      error: (xhr, status, error) => {
        console.error("Error updating task:", error);
      }
    });
  }

}




