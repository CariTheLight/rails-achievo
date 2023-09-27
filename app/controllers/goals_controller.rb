class GoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
  end

  # def index
  # end


  # def new
  # end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
