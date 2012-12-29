class Expert < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :photo, :position, :post, :workplace
  translates :name, :description, :position, :post, :workplace

  default_scope { with_translations(I18n.locale) }

  belongs_to :category
  belongs_to :partner
  has_many :opinions
end
