class Expert < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo, :position, :post, 
    :workplace, :partner_id, :remote_photo_url
  translates :name, :description, :position, :post, :workplace

  default_scope { with_translations(I18n.locale) }

  mount_uploader :photo, ExpertUploader

  belongs_to :category
  belongs_to :partner
  has_many :opinions
end
