class Category < ActiveRecord::Base
  attr_accessible :name
  translates :name

  has_many :experts
  has_many :news
end
