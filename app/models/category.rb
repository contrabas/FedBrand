class Category < ActiveRecord::Base
  attr_accessible :name
  translates :name

  default_scope { with_translations(I18n.locale) }

  has_many :experts
  has_many :news
end
