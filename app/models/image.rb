class Image < ActiveRecord::Base
  attr_accessible :description, :file, :gallery_id, :title

  mount_uploader :file, ImageUploader

  belongs_to :gallery

  validates_presence_of :file
end
