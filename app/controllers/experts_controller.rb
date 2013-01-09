class ExpertsController < ApplicationController
  def index
    
  end
  
  def monthly
    year = params[:year] || Date.today.year
    @date = Date.strptime "#{params[:month]} #{year}", '%B %Y'
    @experts = Expert.joins(:months).where(months: { month: @date.month_span })
  end
end