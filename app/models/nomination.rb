class Nomination < ActiveRecord::Base
  attr_accessible :year

  has_many :jury
  has_many :experts, through: :jury
  has_many :nominees
  has_many :regions, through: :nominees
end
