class AwardCategory < ActiveRecord::Base
  attr_accessible :title
  translates :title

  has_many :nominees
end
