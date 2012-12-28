class Expert < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo, :position, :post, :workplace

  belongs_to :category
  belongs_to :partner
  has_many :opinions
end
