class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @goals = Goal.all
    # if params[:prompt]
    #   prompt = params[:prompt]
    #   @response = OpenaiService.new(prompt).call
    # end
  end

  # def submit_prompt
  #   prompt = params[:prompt]
  #   end_date = Date.parse(params[:end_date]) # Parse the end date from the form

  #   # Calculate the number of days between today and the end date
  #   days = (end_date - Date.today).to_i

  #   # Initialize an array to store tasks for each day
  #   tasks = []

  #   # Loop through each day and generate tasks
  #   (0..days).each do |day|
  #     response = OpenaiService.new("#{prompt} for day #{day + 1}").call
  #     tasks << response
  #   end

  #   @tasks = tasks
  #   render "pages/home"
  # end
end
