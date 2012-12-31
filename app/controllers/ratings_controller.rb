class RatingsController < ApplicationController
  def show
    ids = params[:ids] ? params[:ids].split(',') : Region.first(4).map(&:id)

    gon.watch.data = {
      regions: Region.where(id: ids).map(&:name),
      ratings: Rating.includes(:region).where(regions: {id: ids})
        .sort_by(&:date).group_by{|r| I18n.l(r.date.beginning_of_month)}
        .map{|date, rating| {date => rating.group_by{|r| r.region.name}.to_a}}
    }
  end
end