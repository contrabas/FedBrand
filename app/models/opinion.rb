class Opinion < ActiveRecord::Base
  attr_accessible :content, :expert_id
  translates :content

  default_scope { with_translations(I18n.locale) }

  belongs_to :expert

  validates_presence_of :content
end
