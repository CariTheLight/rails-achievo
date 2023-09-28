class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks

  # def submit_prompt
  #   prompt = params[:prompt]

  #   puts "Prompt: #{prompt}" # Debugging line
  #   response = OpenaiService.new("#{prompt} for 2 days").call
  #   puts "Response: #{response}"

  #   days = (3)

  #   tasks = []
  #   @goal = Goal.find(params[:id])
  #     @task = Task.new(description: response) #, goal_id: @goal.id)
  #     @task.goal = @goal
  #     @task.save

  #   render :home
  # end

  def submit_prompt(goal)
    # Get the user's goal
    # @goal = current_user.goals.find(params[:id])
    # @goal.submit_prompt

    # Generate a task description based on the user's goal
    task_description = generate_tasks_prompt(@goal)

    # Use the OpenaiService to generate a response
    response = OpenaiService.new(task_description).call

    # Create a new task associated with the goal
    @task = @goal.tasks.build(description: response)

    if @task.save
      redirect_to @goal, notice: 'New task generated successfully!'
    else
      flash.now[:alert] = 'Error generating the task.'
      render :new
    end
  end
end
