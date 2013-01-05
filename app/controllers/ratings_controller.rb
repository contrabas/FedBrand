class RatingsController < ApplicationController
  def index
    ids = params[:ids] ? params[:ids].split(',') : Rating.top(4).map(&:first)

    gon.watch.data = {
      regions: Region.where(id: ids).map(&:name),
      ratings: Rating.by_regions(ids).order('date ASC').group_by{|r| 
        I18n.l(r.date.beginning_of_month)}.map{|date, rating| {date => Rating
          .where("date < ?", date.to_date.at_beginning_of_month.next_month)
          .sum_by_region.to_a
        }}
    }
  end

  def monthly
    year = params[:year] || Date.today.year
    @date = Date.strptime "#{params[:month]} #{year}", '%B %Y'
    @experts = Expert.joins(:months).where(months: { month: @date.month_span })
  end
end