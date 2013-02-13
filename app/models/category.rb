class Category < ActiveRecord::Base
  attr_accessible :name_ru, :name_en
  just_define_datetime_picker :edited_time, add_to_attr_accessible: true

  has_many :experts
  has_many :news

  default_scope { order('edited_time DESC') }

  validates_presence_of :name_ru, :name_en
  validates_uniqueness_of :name_ru, :name_en
  before_save {|c| c.slug = name_en.parameterize if name_en_changed? }

  after_initialize :set_default_date

  def to_param
    slug
  end

  def name
    send "name_#{I18n.locale}"
  end

  private

  def set_default_date
    self.edited_time = DateTime.now if new_record?
  end
end