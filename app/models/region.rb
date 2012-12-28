class Region < ActiveRecord::Base
  attr_accessible :emblem, :name

  mount_uploader :emblem, RegionUploader

  has_many :news

  validates_presence_of :emblem, :name
  validates_uniqueness_of :name
end
