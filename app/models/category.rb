class Category < ActiveRecord::Base
  attr_accessible :name_ru, :name_en

  has_many :experts
  has_many :news

  validates_presence_of :name_ru, :name_en
  validates_uniqueness_of :name_ru, :name_en

  def to_param
    name_en.downcase
  end

  def name
    send "name_#{I18n.locale}"
  end
end
