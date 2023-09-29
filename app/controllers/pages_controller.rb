class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    @goals = Goal.all
    # if params[:prompt]
    #   prompt = params[:prompt]
    #   @response = OpenaiService.new(prompt).call
    # end
    # @quotes = MotivationalQuote.all.shuffle.take(1)
    @quotes = MotivationalQuote.all.map &:text

  end

  # def random_quotes
  #   @quotes = MotivationalQuote.all.sample.take(1)
  #   respond_to do |format|
  #     format.json { render json: { quotes: @quotes.map(&:text)}}
  #   end
  # end
end
