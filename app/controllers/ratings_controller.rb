class RatingsController < ApplicationController
  def index
    ids = params[:ids] ? params[:ids].split(',') : Rating.top(4).map(&:region_id)

    gon.watch.data = {
      regions: Region.where(id: ids).map(&:name),
      ratings: Rating.by_regions(ids).order('date ASC').group_by{|r|
        I18n.l(r.date.beginning_of_month)}.map{|date, rating| {
          date => rating.map{|r| [ r.region.name, r.value ]}
        }
      }
    }
  end
end