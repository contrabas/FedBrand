class Gallery < ActiveRecord::Base
  attr_accessible :award_id, :images_attributes

  has_many :images
  belongs_to :award
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_presence_of :award
end
