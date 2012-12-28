class Gallery < ActiveRecord::Base
  attr_accessible :nomination_id, :images_attributes

  has_many :images
  belongs_to :nomination
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_presence_of :nomination
end
