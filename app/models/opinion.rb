class Opinion < ActiveRecord::Base
  attr_accessible :content, :expert_id, :news_opinions_attributes
  just_define_datetime_picker :edited_time, add_to_attr_accessible: true
  translates :content

  default_scope { with_translations(I18n.locale).order('edited_time DESC') }

  belongs_to :expert
  has_many :news_opinions, dependent: :destroy
  has_many :news, through: :news_opinions
  accepts_nested_attributes_for :news_opinions, allow_destroy: true

  validates_presence_of :content
  after_initialize :set_default_date

  private

  def set_default_date
    self.edited_time = DateTime.now if new_record?
  end
end
