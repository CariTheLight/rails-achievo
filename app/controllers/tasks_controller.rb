class TasksController < ApplicationController
  before_action :find_goal
  
  def new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @task = @goal.tasks.new(task_params)

    if @task.save
      redirect_to goal_path(@goal), notice: "Task was successfully created!"
    else
      redirect_to goal_path(@goal), alert: "Error creating the task."
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :name)
  end


  def edit
  end

  def update
  end

  def destroy
  end
  
end
