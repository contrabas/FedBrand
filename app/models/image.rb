class Image < ActiveRecord::Base
  attr_accessible :description, :file, :gallery_id, :title, :remote_file_url
  translates :description, :title

  mount_uploader :file, ImageUploader

  belongs_to :gallery

  validates_presence_of :file
end
