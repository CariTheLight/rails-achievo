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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @goal = @task.goal
    if @task.update(task_params)
      redirect_to goal_path(@goal), notice: 'Task successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to goal_path(@task.goal), status: :see_other
  end




  
end
