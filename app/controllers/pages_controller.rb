class PagesController < ApplicationController
  def index
  end

  def contacts
  end

  def videos
    @videos = Video.unscoped.with_translations(I18n.locale)
      .order('edited_time ASC').limit Video.count-3
  end
end