class News < ActiveRecord::Base
  attr_protected
  translates :content, :title, :published_by
  acts_as_taggable_on :ru_tags, :en_tags
  just_define_datetime_picker :edited_time

  default_scope { with_translations(I18n.locale).order('edited_time DESC') }
  scope :press_centre, where("online is true or announcement is true
    or news.published_by != ''")
  scope :main, where("online is false and announcement is false
    and news.published_by = ''")
  scope :actual, where(actual: true)
  scope :ru, with_translations('ru')
  scope :en, with_translations('en')

  mount_uploader :logo, ImageUploader

  belongs_to :category
  belongs_to :award
  has_many :news_opinions, dependent: :destroy
  has_many :opinions, through: :news_opinions

  validates_presence_of :title, :slug, :category_id
  validates_uniqueness_of :slug

  after_initialize :set_default_date

  def to_param
    slug
  end

  def tags
    I18n.locale == :ru ? ru_tags : en_tags
  end

  def tag_list
    I18n.locale == :ru ? ru_tag_list : en_tag_list
  end

  def tag_list=(value)
    method = I18n.locale == :ru ? :ru_tag_list= : :en_tag_list=
    self.send method, value
  end

  def self.tag_counts
    unscoped { I18n.locale == :ru ? ru_tag_counts : en_tag_counts }
  end

  private

  def set_default_date
    self.edited_time = DateTime.now if new_record?
  end
end