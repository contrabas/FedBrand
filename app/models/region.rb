class Region < ActiveRecord::Base
  attr_accessible :emblem, :name_en, :name_ru, :remote_emblem_url

  mount_uploader :emblem, RegionUploader

  has_many :news
  has_many :ratings

  validates_presence_of :name_ru, :name_en
  validates_uniqueness_of :name_ru, :name_en

  def name
    send "name_#{I18n.locale}"
  end
end
