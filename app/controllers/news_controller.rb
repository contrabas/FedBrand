class NewsController < ApplicationController
  def index
  end

  def tags
    @tag = ActsAsTaggableOn::Tag.find_by_slug! params[:tag]
    @news = News.tagged_with @tag
  end

  def show
    @news = News.find_by_slug! params[:id]
  end

  def category
    @category = Category.find_by_slug! params[:category]
    @news = News.where category_id: @category.id
  end

  def videos
    @videos = Video.all
  end
end