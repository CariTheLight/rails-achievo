class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
    @tasks = @goal.tasks
  end

  def new
    # @user = current_user
    @goal = current_user.goals.build
  end

  #   if @task.save
  #     redirect_to @goal, notice: 'New task generated successfully!'
  #   else
  #     flash.now[:alert] = 'Error generating the task.'
  #     render :new
  #   end
  # end

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
    # raise
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save! && @goal.generate_tasks
      Goal.submit_prompt(@goal)
      redirect_to goal_path(@goal), notice: "Goal and tasks were successfully created!"
    elsif @goal.save! && !@goal.generate_tasks
      redirect_to goal_path(@goal), notice: "Goal was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    # raise
    if @goal.update(goal_params)
      redirect_to goal_path(@goal), notice: "Goal was succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to root_path, notice: "Goal was succesfully deleted"
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :start_date, :end_date, :resources, :time_available, :generate_tasks)
  end
end
