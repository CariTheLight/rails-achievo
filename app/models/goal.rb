class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks

  serialize :completed_steps, Array

  # def generate_tasks_prompt(goal)
  #   "My goal is to #{goal.description}.
  #   I want to start on #{goal.start_date.strftime('%A %d %B %Y')} and I want to end on #{goal.end_datestrftime('%A %d %B %Y')}.
  #   I have access to #{goal.resources}.
  #   Additionally, I've allocated #{goal.time_available} to dedicate towards
  #   making this goal a reality. Please give me a step breakdown
  #   of what I need to do to achieve my goal by the end of the
  #   specified date. Please also label each step with a day of the week and a date. 
  #   Please return this information as an array of tasks"
  # end

  def self.submit_prompt(goal)
    # Get the user's goal
    # @goal = current_user.goals.find(params[:id])
    # @goal.submit_prompt

    # Generate a task description based on the user's goal
    # task_description = generate_tasks_prompt(goal)
    # task_description = "My goal is to #{goal.description}.
    # I want to start on #{goal.start_date.strftime('%A %d %B %Y')} 
    # and I want to end on #{goal.end_date.strftime('%A %d %B %Y')}.
    # I have access to #{goal.resources}.
    # Additionally, I've allocated #{goal.time_available} towards
    # making this goal a reality. Provide steps to achieve this. 
    # Return the response an array where each element is a step 
    # towards this goal - the only commas should be the ones between elements (steps). 
    # Ignore any other commas necessary for grammar."

    task_description = "My goal is to #{goal.description}.
    I want to start on #{goal.start_date.strftime('%A %d %B %Y')} 
    and I want to end on #{goal.end_date.strftime('%A %d %B %Y')}.
    I have access to #{goal.resources}.
    Additionally, I've allocated #{goal.time_available} towards
    making this goal a reality. Please provide a list of numbered steps on each new line, to achieve this goal."
    # Each step should be on a new line and should be numbered.
    
  # Your prompt generation code here...

  # Please give me a step breakdown
  #     of what I need to do to achieve my goal by the end of the
  #     specified date. Please also label each step with a day of the week and a date. 
  #     Please return this information as an array where each step is an element of the array
    # Use the OpenaiService to generate a response
    response = OpenaiService.new(task_description).call
    # Split the text using regular expression
    # sections = response.split(/\n\d+\./)

    # # Remove empty sections (e.g., when there are consecutive line breaks)
    # sections.reject!(&:empty?)

    # # Trim leading and trailing whitespace from each section
    # sections.map!(&:strip)


    # # Create a new task associated with the goal
    # sections.each do |step|
    #   @task = goal.tasks.build(description: step)
    # end
    
    steps = response.split("\n")
    steps.each do |step|
    # Create a new Task associated with the Goal (or other relevant entity)
    task = Task.new(description: step, goal_id: goal.id)
  
      if task.save
        # redirect_to goal, notice: 'New task generated successfully!'
        puts "Task saved successfully"
        # puts response
        # puts sections
      else
        flash.now[:alert] = 'Error generating the task.'
        render :new
      end

  # Assuming you have a Goal or Task model to associate these steps with
  # Loop through the steps and create checkboxes for each step
    end
  end
end 