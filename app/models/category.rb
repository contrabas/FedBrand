class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :experts
  has_many :news
end
