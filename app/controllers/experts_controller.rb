class ExpertsController < ApplicationController
  def index
  end

  def show
    @expert = Expert.find_by_slug! params[:id]
  end
  
  def monthly
    year = params[:year] || Date.today.year
    @date = Date.strptime "#{params[:month]} #{year}", '%B %Y'
    @experts = Expert.joins(:months).where(months: { month: @date.month_span })
  end
end