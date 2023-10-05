class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :journal_entries, through: :tasks

  def self.submit_prompt(goal)
    task_description = "My goal is to #{goal.description}.
    I want to start on #{goal.start_date.strftime('%A %d %B %Y')}
    and I want to end on #{goal.end_date.strftime('%A %d %B %Y')}.
    I have access to #{goal.resources}.
    Additionally, I've allocated #{goal.time_available} towards
    making this goal a reality. Please provide a list of steps in numbered form on each new line, to achieve this goal."
    response = OpenaiService.new(task_description).call

    steps = response.split("\n")
    steps.each_with_index do |step, index|
      task = Task.new(description: step, goal_id: goal.id, completed: false, order: index+1)
      
      if task.save
        puts "Task saved successfully"
      else
        flash.now[:alert] = 'Error generating the task.'
        render :new
      end
    end
  end

  def update_progress
    total_tasks = tasks.count
    completed_tasks = tasks.where(completed: true).count

    if total_tasks > 0
      progress = (completed_tasks.to_f/total_tasks)*100
    else
      progress = 0
    end
    return progress.floor
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true, position: 1)
  end

  def uncomplete
    @task = Task.find(params[:id])
    @task.update(completed: false, position: -1)
  end
end
