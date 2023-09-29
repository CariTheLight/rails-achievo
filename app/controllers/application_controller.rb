class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_navbar_goals

  private

  def set_navbar_goals
    @navbar_goals = current_user.goals if user_signed_in?
    
  end
end
