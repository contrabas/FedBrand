class Image < ActiveRecord::Base
  attr_accessible :description, :file, :gallery_id, :title
  translates :description, :title

  mount_uploader :file, ImageUploader

  belongs_to :gallery

  validates_presence_of :file
end
