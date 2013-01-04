class Video < ActiveRecord::Base
  attr_accessible :thumb, :remote_thumb_url, :title, :tag
  translates :title

  default_scope { with_translations(I18n.locale) }

  mount_uploader :thumb, VideoUploader
end
