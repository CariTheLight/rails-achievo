class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end

  def new
    # @user = current_user
    @goal = current_user.goals.build
  end

  def generate_task
    # Use an AI model or service to generate a goal prompt
    @goal = current_user.goals.find(params[:goal_id])
    task_description = generate_task_description(@goal)

    # Create a new task with the generated description
    @task = @goal.tasks.build(description: task_description)

    if @task.save
      redirect_to @goal, notice: 'New task generated successfully!'
    else
      flash.now[:alert] = 'Error generating the task.'
      render :new
    end
  end

  def generate_task_description(goal)
    "My goal is to #{goal.description}.
    I want to start on #{goal.start_date.strftime('%A %d %B %Y')} and I want to end on #{goal.end_datestrftime('%A %d %B %Y')}.
    I have access to #{goal.resources}.
    Additionally, I've allocated #{goal.time_available} to dedicate towards
    making this goal a reality. Please give me a step breakdown
    of what I need to do to achieve my goal by the end of the
    specified date. Please also label each step with a day of the week and a date. 
    Please return this information as an array of tasks"
  end


  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save!
      redirect_to goal_path(@goal), notice: "Goal was successfully created!"
    else
      render :new, alert: "Please try again"
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to @goal, notice: "Goal was succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url, notice: "Goal was succesfully deleted"
  end
  
  private

  def goal_params
    params.require(:goals).permit(:name, :description, :start_date, :end_date, :status, :resources, :time_available, :user_id)
  end
end
