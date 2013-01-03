class News < ActiveRecord::Base
  attr_accessible :category_id, :content, :logo, :preview, :publish_url, 
                  :published_by, :region_id, :title, :remote_logo_url
  translates :content, :title

  default_scope { with_translations(I18n.locale) }

  mount_uploader :logo, ImageUploader

  belongs_to :category
  belongs_to :region

  validates_presence_of :title
end
