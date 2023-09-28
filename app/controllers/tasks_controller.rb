class TasksController < ApplicationController
  def new
    @goal = Goal.find(params[:goal_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @goal = Goal.find(params[:goal_id])
    @task.goal = @goal
    if @task.save
      redirect_to goal_path(@goal), notice: 'Task was successfully created.'
    else
      render :new, alert: :unprocessable_entity
    end
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

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
