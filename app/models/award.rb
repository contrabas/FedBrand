class Award < ActiveRecord::Base
  attr_accessible :year, :ended, :jurors_attributes, :nominees_attributes

  has_many :jurors
  has_many :experts, through: :jurors
  accepts_nested_attributes_for :jurors, allow_destroy: true

  has_many :nominees
  has_many :regions, through: :nominees
  accepts_nested_attributes_for :nominees, allow_destroy: true

  has_many :news

  validates_presence_of :year
  validates_uniqueness_of :year

  def name
    try :year
  end
end
