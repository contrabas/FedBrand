class Region < ActiveRecord::Base
  attr_accessible :emblem, :name
  translates :name

  default_scope { with_translations(I18n.locale) }

  mount_uploader :emblem, RegionUploader

  has_many :news
  has_many :ratings

  validates_presence_of :emblem, :name
  validates_uniqueness_of :name
end
