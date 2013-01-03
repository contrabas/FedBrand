class RatingsController < ApplicationController
  def index
    ids = params[:ids] ? params[:ids].split(',') : Region.first(4).map(&:id)

    gon.watch.data = {
      regions: Region.where(id: ids).map(&:name),
      ratings: Rating.by_regions(ids).order('date ASC').group_by{|r| 
        I18n.l(r.date.beginning_of_month)}.map{|date, rating| {date => Rating
          .where("date < ?", date.to_date.at_beginning_of_month.next_month)
          .sum(:value, include: :region, group: "regions.name").to_a
        }}
    }
  end
end