class Static < ActiveRecord::Base
  attr_accessible :content_ru, :content_en, :name

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.content_column
    "content_#{I18n.locale}"
  end

  def content
    send Static.content_column
  end
end
