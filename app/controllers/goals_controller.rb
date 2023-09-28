class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
    @tasks = @goal.tasks
  end

  def new
    # @user = current_user
    @goal = current_user.goals.build
  end

  # def generate_task
  #   # Use an AI model or service to generate a goal prompt
  #   @goal = current_user.goals.find(params[:goal_id])
  #   task_description = generate_task_description(@goal)

  #   # Create a new task with the generated description
  #   @task = @goal.tasks.build(description: task_description)

  #   if @task.save
  #     redirect_to @goal, notice: 'New task generated successfully!'
  #   else
  #     flash.now[:alert] = 'Error generating the task.'
  #     render :new
  #   end
  # end

 

  def create
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
    params.require(:goal).permit(:name, :description, :start_date, :end_date, :resources, :time_available, :generate_tasks)
  end
end
