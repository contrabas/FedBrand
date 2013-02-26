class Video < ActiveRecord::Base
  attr_accessible :thumb, :remote_thumb_url, :title, :tag
  just_define_datetime_picker :edited_time, add_to_attr_accessible: true
  translates :title

  default_scope { with_translations(I18n.locale).order('edited_time DESC') }

  mount_uploader :thumb, VideoUploader

  after_initialize :set_default_date

  private

  def set_default_date
    self.edited_time = DateTime.now if new_record?
  end
end
