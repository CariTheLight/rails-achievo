class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end

  def generate_goal
    # Use an AI model or service to generate a goal prompt
    goal_description = generate_goal_description

    # Create a new goal with the generated description
    @goal = Goal.new(description: goal_description)

    if @goal.save
      redirect_to @goal, notice: 'New goal generated successfully!'
    else
      flash.now[:alert] = 'Error generating the goal.'
      render :new
    end
  end

  private

  # Example method to generate a goal description using an AI service
  def generate_goal_description
    # You can call an AI service here to generate a goal description
    # For instance, using an API request to a language model
    # Replace this with the actual logic to generate a goal description
    # You might use an external service or your own AI model integration
    # For simplicity, we'll use a placeholder description here
    "Learn a new language and become conversational."
  end

  def new
    @goal = Goal.new
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
end
