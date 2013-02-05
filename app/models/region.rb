class Region < ActiveRecord::Base
  attr_accessible :emblem, :name_en, :name_ru, :remote_emblem_url

  mount_uploader :emblem, RegionUploader

  has_many :ratings
  has_many :nominees
  has_many :awards, through: :nominees

  validates_presence_of :name_ru
  validates_uniqueness_of :name_ru

  def self.name_column
    "name_#{I18n.locale}"
  end

  def name
    send Region.name_column
  end
end
