class TasksController < ApplicationController
  # before_action :find_goal

  def new
    @goal = Goal.find(params[:goal_id])
    @task = Task.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @task = Task.new(task_params)
    @task.goal = @goal
    @task.completed = false
    count = @goal.tasks.count
    @task.order = count + 1
    if @task.save
      redirect_to goal_path(@goal), notice: "Task was successfully created!"
    else
      redirect_to goal_path(@goal), alert: "Error creating the task."
    end
  end

  def edit
    @task = Task.find(params[:id])
    @goal = @task.goal
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
    @goal = @task.goal
    @task.destroy
    redirect_to goal_path(@goal), status: :see_other
  end 

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true)
  end

  def uncomplete
    @task = Task.find(params[:id])
    @task.update(completed: false)
  end

  private

  def task_params
    params.require(:task).permit(:description, :name, :completed)
  end
end
