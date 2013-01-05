class News < ActiveRecord::Base
  attr_accessible :category_id, :content, :logo, :preview, :publish_url, 
              :published_by, :region_id, :title, :remote_logo_url, :award_id
  translates :content, :title, :published_by

  default_scope { with_translations(I18n.locale) }

  mount_uploader :logo, ImageUploader

  belongs_to :category
  belongs_to :region
  belongs_to :award

  validates_presence_of :title
end
