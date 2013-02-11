class NewsOpinion < ActiveRecord::Base
  attr_accessible :news_id, :opinion_id

  belongs_to :news
  belongs_to :opinion
end
