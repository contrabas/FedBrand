class RatingsController < ApplicationController
  def show
    sorted = Rating.includes(:region).where(regions: {id: [1,2,3,4,5,6]}).sort_by(&:date)

    gon.data = {
      regions: Region.where(regions: {id: [1,2,3,4,5,6]}).map(&:name),
      ratings: sorted.group_by{|r| I18n.l(r.date.beginning_of_month)}
        .map{|date, rating| {date => rating.group_by{|r| r.region.name}.to_a}},
      interval: ((sorted.last.date.year*12 + sorted.last.date.month) - 
        (sorted.first.date.year*12 + sorted.first.date.month)).abs + 1,
      last_date: I18n.l(sorted.last.date)
    }
  end
end