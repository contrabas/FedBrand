class News < ActiveRecord::Base
  attr_accessible :category_id, :content, :logo, :preview, :publish_url, 
                  :published_by, :region_id, :title
  translates :content, :title

  belongs_to :category
  belongs_to :region
end
