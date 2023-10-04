$(document).on('click', '.complete-task', function() {
    var goal_id = $(this).data('goal-id');
    // Send an AJAX request to update progress when a task is completed
    $.ajax({
      type: 'PUT',
      url: '/goals/' + goal_id + '/update_progress',
      success: function(data) {
        // Update the progress bar on the page
        $('.progress-bar').css('width', data.progress + '%');
      }
    });
  });

  $(document).ready(function() {
    // Listen for changes in checkbox state
    $('.check_box').on('change', function() {
      var taskCard = $(this).closest('.task-card');
      var taskList = taskCard.closest('.task-list');

      // Check if the checkbox is checked
      if ($(this).is(':checked')) {
        // Move the completed task to the bottom
        taskList.append(taskCard);
      } else {
        // Move the uncompleted task to the top (optional)
        taskList.prepend(taskCard);
      }
    });
  });
