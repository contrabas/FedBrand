class Award < ActiveRecord::Base
  attr_accessible :year, :ended

  has_many :jury
  has_many :experts, through: :jury
  has_many :nominees
  has_many :regions, through: :nominees

  def to_param
    "archive/#{year}"
  end
end
