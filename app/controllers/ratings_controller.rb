class RatingsController < ApplicationController
  def show
    gon.regions = Region.where(regions: {id: [1,2,3,4,5,6]}).map(&:name)
    gon.ratings = Rating.includes(:region).where(regions: {id: [1,2,3,4,5,6]})
      .group_by{|r| I18n.l(r.date.beginning_of_month, format: '%b %y')}
      .map{|date, rating| {date => rating.group_by{|r| r.region.name}.to_a}}
  end
end