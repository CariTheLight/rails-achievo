class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks

  def self.submit_prompt(goal)
    task_description = "My goal is to #{goal.description}.
    I want to start on #{goal.start_date.strftime('%A %d %B %Y')}
    and I want to end on #{goal.end_date.strftime('%A %d %B %Y')}.
    I have access to #{goal.resources}.
    Additionally, I've allocated #{goal.time_available} towards
    making this goal a reality. Please provide a list of steps in bullet form on each new line, to achieve this goal."
    response = OpenaiService.new(task_description).call

    steps = response.split("\n")
    steps.each do |step|
      task = Task.new(description: step, goal_id: goal.id)

      if task.save
        puts "Task saved successfully"
      else
        flash.now[:alert] = 'Error generating the task.'
        render :new
      end
    end
  end
end
