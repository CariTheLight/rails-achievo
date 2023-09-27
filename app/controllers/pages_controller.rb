class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:prompt]
      prompt = params[:prompt]
      @response = OpenaiService.new(prompt).call
    end
  end

  def submit_prompt
    prompt = params[:prompt]
    @response = OpenaiService.new(prompt).call
    puts @response
    render "pages/home"
  end
end
