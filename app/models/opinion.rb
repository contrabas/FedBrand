class Opinion < ActiveRecord::Base
  attr_accessible :content, :expert_id, :news_opinions_attributes
  translates :content

  default_scope { with_translations(I18n.locale) }

  belongs_to :expert
  has_many :news_opinions, dependent: :destroy
  has_many :news, through: :news_opinions
  accepts_nested_attributes_for :news_opinions, allow_destroy: true

  validates_presence_of :content
end
